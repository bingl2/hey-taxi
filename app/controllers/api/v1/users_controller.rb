class Api::V1::UsersController < ApiController
  swagger_controller :users, "유저 API"

  swagger_api :create do
    summary "회원 가입"
    notes "승객, 기사가 회원 가입을 진행합니다."
    param :form, :email, :string, :required, "계정 email"
    param :form, :password, :string, :required, "비밀번호"
    param :form, :password_check, :string, :required, "비밀번호 확인"
    param :form, :type, :string, :required, "고객 유형 (#{User::TYPES.keys.join(', ')})"
    param :form, :name, :string, :optional, "이름"
    param :form, :phone_number, :string, :optional, "전화번호"
  end

  swagger_api :login do
    summary "로그인"
    notes "로그인을 진행하여 토큰을 받아오자!"
    param :form, :email, :string, :required, "계정 email"
    param :form, :password, :string, :required, "비밀번호"
  end

  def create
    email = params[:email]
    fail ApiException.new(error: :ALREADY_SIGN_UP, status: 400) if User.find_by_email(params[:email]).present? #TODO email 유효성 검사 추가 하자

    password = params[:password]
    fail ApiException.new(error: :INVALID_PASSWORD, status: 400) unless valid_password(password, params[:password_check])

    type = params[:type]
    fail ApiException.new(error: :INVALID_TYPE, status: 400) unless type_check(type)

    @user = User.create!(
        email: email,
        password: encrypt_password(password),
        type: type,
        name: params[:name],
        phone_number: params[:phone_number]
    )

    result_merge(access_token: @user.get_access_token)

    success
  end

  def login
    check_email_password(params[:email], params[:password])
    result_merge(access_token: @user.get_access_token)

    success
  end

  private

  def check_email_password(email, password)
    @user = User.find_by_email(email)
    fail ApiException.new(error: :INVALID_EMAIL_PASSWORD, status: 400) if @user.nil? || @user.password != password
  end

  def type_check(type)
    User.type_check(type)
  end

  def valid_password(password, password_check)
    false if password != password_check

    #TODO password 유효성 검사 추가
    true
  end

  def encrypt_password(password)
    #TODO Hash 알고리즘 찾아서 따로 모듈로 만들어서 빼놓자.
    password
  end
end
