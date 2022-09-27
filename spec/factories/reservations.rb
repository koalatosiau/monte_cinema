FactoryBot.define do
  factory :reservation do
    screening
    quantity { 5 }
    status { 'pending' }
  end
end
