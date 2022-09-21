FactoryBot.define do
  factory :screening do
    hall
    movie
    start { Faker::Time.forward(days: 3, period: :evening) }
  end
end

