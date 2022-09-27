class Screening < ApplicationRecord
  belongs_to :hall
  belongs_to :movie
  has_many :reservations, dependent: :nullify

  validates :start, presence: true
end
