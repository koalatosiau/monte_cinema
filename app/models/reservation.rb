class Reservation < ApplicationRecord
  self.ignored_columns = ['quantity']
  CANCELLATION_TIME = 30.minutes

  belongs_to :screening
  has_many :seats, dependent: :destroy

  accepts_nested_attributes_for :seats

  enum status: { pending: 0, confirmed: 1, cancelled: 2 }

  validates :status, presence: true
  validates :email, presence: true

  delegate :movie_title_with_start, to: :screening
end
