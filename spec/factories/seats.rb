FactoryBot.define do
  factory :seat do
    reservation
    number { Faker::Number.number(digits: 1) }
  end
end
