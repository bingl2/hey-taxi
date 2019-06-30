class User < ApplicationRecord
  has_one :access_token

  TYPES = {
      Passenger: '승객',
      Driver: '기사'
  }

  def is_passenger?
    #TODO 기사인지, 승객인지의 여부를 조금더 고민해보기. 타입이 더 늘어날경우에는 어떻게 대처할 수 있지.
    self.type == "Passenger"
  end

  def self.type_check(type)
    TYPES.keys.include?(type.to_sym)
  end

  def get_access_token
    self.access_token ||= AccessToken.create!(user: self)

    self.access_token.access_token
  end
end
