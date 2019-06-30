class User < ApplicationRecord
  has_one :access_token

  TYPES = {
      Passenger: '승객',
      Driver: '기사'
  }

  def self.type_check(type)
    TYPES.keys.include?(type.to_sym)
  end

  def get_access_token
    self.access_token ||= AccessToken.create!(user: self)

    self.access_token.access_token
  end
end
