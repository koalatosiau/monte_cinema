FactoryBot.define do
  factory :reservation do
    screening
    quantity { 5 }
    status { 'pending' }
    email { 'example@example.com' }
  end
end
