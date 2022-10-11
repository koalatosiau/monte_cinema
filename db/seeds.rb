# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
hall_capacities = [10, 30, 50, 100, 150]
(5 - Hall.count).times do
  Hall.find_or_create_by(name: Faker::Color.color_name.capitalize, capacity: hall_capacities.sample)
end

movie_runtimes = [72, 90, 100, 120, 175]
(5 - Movie.count).times do
  Movie.find_or_create_by(title: Faker::Movie.title, description: Faker::Lorem.paragraph, runtime: movie_runtimes.sample)
end

# Update screening seeds to iterate over halls or days_in_advance if restricting screening to one per hall at the time.
days_in_advance = [2, 3, 4, 5, 7]
Movie.all.each do |movie|
  ((1..5).to_a.sample).times do
    Screening.find_or_create_by(hall: Hall.all.sample, movie: movie, start: Time.new.next_day(days_in_advance.sample))
  end
end

user = User.find_by(email: 'user@example.com')
User.create(email: 'user@example.com', password: '123456', password_confirmation: '123456') unless user

admin = User.find_by(email: 'admin@example.com')
User.create(email: 'admin@example.com', password: '123456', password_confirmation: '123456', role: :admin) unless admin
