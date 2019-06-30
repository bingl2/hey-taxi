class Api::V1::TransportsController < ApiController
  before_action :require_access_token
  before_action :passenger_check, only: [:create]

  swagger_controller :transports, "배차, 수송 관련 API"

  swagger_api :index do |api|
    summary "배차 리스트"
    notes "승객이 요청한 모든 배차 리스트를 전달"
    ApiController.swagger_access_token(api)
  end

  swagger_api :create do |api|
    summary "배차 요청"
    notes "승객이 배차를 승락함"
    param :form, :destination, :string, :require, "목적지"
    ApiController.swagger_access_token(api)
  end

  def index

    success
  end

  def create
    destination = params[:destination]
    fail ApiException.new(error: :INVALID_DESTINATION, status: 400) unless valid_destination(destination)
    fail ApiException.new(:ALREADY_REQUEST) unless @user.request_able?

    @user.transport_request(destination)

    success
  end

  private

  def valid_destination(destination)
    #TODO 목적지 관련한 검증이 필요할 경우 추가

    true
  end

end
