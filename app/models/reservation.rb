class Reservation < ApplicationRecord
  belongs_to :screening
  enum status: { pending: 0, confirmed: 1, cancelled: 2 }

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :status, presence: true
end
