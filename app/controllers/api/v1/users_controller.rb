class Api::V1::UsersController < ApiController
  swagger_controller :users, "유저 관리"

  swagger_api :create do
    summary "회원 가입"
    notes "승객, 기사가 회원 가입을 진행합니다."
    param :form, :email, :string, :required, "계정 email"
    param :form, :password, :password, :required, "비밀번호"
    param :form, :type, :string, :required, "유저 Type"
    param :query, :page, :integer, :optional, "Page number"
    param :path, :nested_id, :integer, :optional, "Team Id"
  end

  def create

  end
end
