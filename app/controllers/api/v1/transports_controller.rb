class Api::V1::TransportsController < ApiController
  swagger_controller :transports, "배차, 수송 관련 API"

  swagger_api :index do
    summary "회원 가입"
    notes "승객, 기사가 회원 가입을 진행합니다."
    param :form, :email, :string, :required, "계정 email"
    param :form, :password, :string, :required, "비밀번호"
    param :form, :password_check, :string, :required, "비밀번호 확인"
    param :form, :type, :string, :required, "고객 유형 (#{User::TYPES.keys.join(', ')})"
    param :form, :name, :string, :optional, "이름"
    param :form, :phone_number, :string, :optional, "전화번호"
  end

  def index

  end

end
