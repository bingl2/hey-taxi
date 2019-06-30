class ApiController < ApplicationController
  skip_before_action :verify_authenticity_token

  include Swagger::Docs::ImpotentMethods

  def self.swagger_access_token(api, required = true)
    api.param :form, :access_token, :long, required ? :required : :optional, "Access Token"
  end
end
