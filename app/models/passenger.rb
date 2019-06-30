class Passenger < User
  has_many :transports, foreign_key: 'passenger_id'

  def transport_request(destination)
    # TODO 이 부분을 레디스에 큐에 넣는게 좋을까, 기사가 확정을 할 때 넣는게 좋을까

  end

  def request_able?
    self.transports.not_completed.count < 1
  end
end
