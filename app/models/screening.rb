class Screening < ApplicationRecord
  belongs_to :hall
  belongs_to :movie

  validates :start, presence: true
end
