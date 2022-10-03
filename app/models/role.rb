class Role < ApplicationRecord
  belongs_to :user
  enum access_level: {guest: 0, user: 1, admin: 2 }

  validates :access_level, presence: true
end
