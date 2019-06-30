class User < ApplicationRecord
  has_one :access_token

  def get_access_token
    self.access_token ||= AccessToken.create!(user: self)
    self.access_token.access_token
  end
end
