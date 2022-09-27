class Reservation < ApplicationRecord
  belongs_to :screening

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :status, inclusion: { in: %w[pending confirmed cancelled] }
end
