class Movie < ApplicationRecord
  validates :title, presence: true
  validates :description, length: { maximum: 500 }
  validates :runtime, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
