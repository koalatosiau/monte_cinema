class Hall < ApplicationRecord
  has_many :screenings
  has_many :movies, through: :screenings

  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true, numericality: { greater_than: 0 }
end
