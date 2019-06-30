class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  include Swagger::Docs::ImpotentMethods

  class ApiException < Exception
    attr_reader :error, :status

    def initialize(args = {})
      if args.is_a?(Hash)
        @error = args[:error]
        @status = args[:status]
      else
        @error = args
      end
    end
  end

  before_action :authorize
  around_action :transactional

  private

  def transactional
    ActiveRecord::Base.transaction do
      begin
        yield
      rescue ApiException => e
        add_error_string "#{e.class}: error: #{e.error} status: #{e.status}"
        Rails.logger.warn("error_string: #{@error_string} params: #{params}")
        error(error: e.error, status: e.status)
      end
    end
  end

  def initialize
    @request_time = Time.current
    @result = nil
    @error = nil
    @message = nil
    @error_string = []
  end

  def common_response(args = {})
    @result = args[:result] || @result
    @success = args[:success].nil? ? @success : args[:success]
    @error = args[:error] unless args[:error].nil?
    @message = ERROR_MESSAGES[@error]

    @result = nil unless @success
    @status = args[:status] || 200

    render json: {
        status: @success.to_s == "true" ? "SUCCESS" : "FAIL",
        result: @result,
        error: @error,
        message: @message,
        requestDateTime: @request_time.to_s(:admin),
        responseDateTime: Time.current.to_s(:admin)
    }, status: @status
  end

  def success
    common_response(success: true)
  end

  def error(args = {})
    common_response(args.merge(success: false))
  end

  def result_merge(args = {})
    @result = {} unless @result.is_a? Hash
    @result.merge! args
  end

  def add_error_string(string)
    @error_string << string
  end

  def self.swagger_access_token(api, required = true)
    api.param :query, :access_token, :long, required ? :required : :optional, "Access Token"
  end

  def authorize
    access_token = params[:access_token]

    if access_token.present? && access_token.to_i > 0
      token = AccessToken.find_by_access_token(access_token)
      @user = token.try(:user)
    end
  end

  def require_access_token
    fail ApiException.new(:INVALID_ACCESS_TOKEN) if @user.nil?
  end

  def passenger_check
    fail ApiException.new(:NO_PASSENGER) unless @user.is_passenger?
  end

  def driver_check
    fail ApiException.new(:NO_DRIVER) if @user.is_passenger?
  end

  ERROR_MESSAGES = {
      INVALID_ACCESS_TOKEN: "유효하지 않은 계정입니다.",
      INVALID_EMAIL_PASSWORD: "이메일 또는 비밀번호가 틀렸습니다.",
      INVALID_EMAIL: "유효하지 않은 이메일 주소 입니다.",
      INVALID_PASSWORD: "유효하지 않은 비밀번호 입니다.",
      INVALID_TYPE: "유효하지 않은 계정 유형입니다.",
      INVALID_DESTINATION: "유효하지 않은 목적지입니다.",

      NO_PASSENGER: "승객이 아닙니다.",
      NO_DRIVER: "기사가 아닙니다.",

      ALREADY_SIGN_UP: "이미 가입한 사용자입니다.",
      ALREADY_REQUEST: "이미 배차를 요청한 상태입니다.",
  }
end
