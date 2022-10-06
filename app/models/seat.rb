class Seat < ApplicationRecord
  belongs_to :reservation

  validates :number, presence: true
end
