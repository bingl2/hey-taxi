class Passenger < User
  has_many :transports, foreign_key: 'passenger_id'

  def transport_request(destination)
    # TODO 사용중인 request 가 있을 경우 리퀘스트 요청 실패하도록 수정

  end

  def request_able?
    self.transports.not_completed.count < 1
  end
end
