class Transport < ApplicationRecord
  belongs_to :passenger
  belongs_to :driver

  scope :using, -> { where(use_yn: 'Y') }
  scope :not_completed, -> { where.not(status: 'COMPLETED')}

  STATUS = %w(WAIT CANCEL PROGRESS COMPLETED)

end
