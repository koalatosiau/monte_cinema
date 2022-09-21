class Movie < ApplicationRecord
  has_many :screenings
  has_many :halls, through: :screenings

  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :runtime, presence: true, numericality: { greater_than: 0 }
end
