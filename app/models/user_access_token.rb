class UserAccessToken < ApplicationRecord
  # 임시 엑세스 토큰 테이블, 시간이 남을 경우 JWT 적용 해보도록 하자.
  belongs_to :user

  def self.generate_access_token(user)
    "#{Time.current.to_i}#{user.id}"
  end
end
