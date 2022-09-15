class Hall < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :capacity, presence: true, numericality: { :greater_than => 0 }

end
