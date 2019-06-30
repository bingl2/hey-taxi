class AccessToken < ApplicationRecord
  # 임시 엑세스 토큰 테이블, 시간이 남을 경우 JWT 적용 해보도록 하자.
  belongs_to :user

  before_create :default_value

  private

  def default_value
    self.access_token = "#{Time.current.to_i}#{user.id}" if access_token.nil?
  end
end
