class Screening < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations, dependent: :nullify

  validates :start, presence: true

  delegate :capacity, to: :hall

  def movie_title_with_start
    "#{movie.title}, #{start.strftime('%d %b %Y, %H:%M')}"
  end

  def seats_taken
    reservations.map do |reservation|
      reservation.seats_reserved
    end
    .flatten
  end

  def seats_availability
    (1..capacity).to_a  - seats_taken
  end
end
