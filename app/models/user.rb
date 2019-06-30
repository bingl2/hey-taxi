class User < ApplicationRecord
  # psql 사용하면 (https://github.com/TwilightCoders/active_record-mti) 이걸로 테이블 분할 해보는 것도 좋을것 같다.
  has_one :access_token

  def get_access_token
    self.access_token ||= AccessToken.create!(user: self)
    self.access_token.access_token
  end
end
