FactoryBot.define do
  factory :movie do
    title { Faker::Movie.title }
    description { Faker::Lorem.paragraph }
    runtime { 120 }
  end
end
