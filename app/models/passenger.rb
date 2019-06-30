class Passenger < User
  has_many :transports, foreign_key: 'passenger_id'

end
