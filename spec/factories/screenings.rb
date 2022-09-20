FactoryBot.define do
  factory :screening do
    hall_id { create(:hall).id }
    movie_id { create(:movie).id }
    start { Faker::Time.forward(days: 3, period: :evening) }
  end
end
