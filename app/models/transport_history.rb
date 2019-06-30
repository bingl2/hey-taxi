class TransportHistory < ApplicationRecord
  scope :using, -> { where(use_yn: 'Y') }
  scope :not_completed, -> { where.not(status: 'COMPLETED')}

  STATUS = %w(WAIT CANCEL PROGRESS COMPLETED)

  #TODO trasnport 용 훅 만들어서 히스토리 남기기
end
