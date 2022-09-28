# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
hall_capacities = [10, 15, 20, 30, 35, 50, 100, 150]
hall_capacities.each do |capacity|
    Hall.find_or_create_by(name: Faker::Color.color_name.capitalize, capacity: capacity)
end

movie_runtimes = [72, 90, 99, 100, 120, 140, 175]
movie_runtimes.each do |runtime|
  Movie.find_or_create_by(title: Faker::Movie.title, description: Faker::Lorem.paragraph, runtime: runtime)
end
