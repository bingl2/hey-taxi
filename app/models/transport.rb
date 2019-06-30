class Transport < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  has_many :transport_histories

  scope :not_completed, -> {
    joins(:transport_histories)
        .merge(TransportHistory.using)
        .merge(TransportHistory.not_completed)
  }

end
