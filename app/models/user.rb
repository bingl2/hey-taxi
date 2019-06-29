class User < ApplicationRecord
  has_one :driver
  has_one :passenger
end
