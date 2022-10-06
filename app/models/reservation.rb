class Reservation < ApplicationRecord
  belongs_to :screening
  has_many :seats
  enum status: { pending: 0, confirmed: 1, cancelled: 2 }

  validates :quantity, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :status, presence: true
  validates :email, presence: true

  delegate :movie_title_with_start, to: :screening

  def seats_reserved
    seats.pluck(:number)
  end
end
