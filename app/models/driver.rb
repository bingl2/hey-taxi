class Driver < User
  has_many :transports, foreign_key: 'driver_id'
end
