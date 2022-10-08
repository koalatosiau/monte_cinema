FactoryBot.define do
  factory :reservation do
    screening
    status { 'pending' }
    email { 'example@example.com' }
  end
end
