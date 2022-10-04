FactoryBot.define do
  factory :role do
    user
    access_level { Role.access_levels.keys.sample }
  end
end
