class Screening < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations, dependent: :nullify

  validates :start, presence: true

  def movie_tite_with_start
    "#{movie.title}, #{start.strftime('%d %b %Y, %H:%M')}"
  end
end
