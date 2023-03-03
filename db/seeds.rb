# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
Review.destroy_all
Booking.destroy_all
Car.destroy_all
User.destroy_all
# Booking.destroy_all

john = User.create(first_name: "John", last_name: "Smith", email: "user1@aol.com", address: "Köln", password: "password")

# puts "Creating Cars"
# bmw = { brand: "Bmw", model: "Serie 3", location: "Chlodwigplatz Köln", number_plate: "Kaa7586", capacity: "5", year: "2018", price: "35", user: john }
# mercedes = { brand: "Mercedes", model: "A1", location: "Rudolfplatz Köln", number_plate: "Kbb0002", capacity: "4", year: "2020", price: "30", user: john }
# audi = { brand: "Audi", model: "A5", location: "Barbarossaplatz Köln", number_plate: "Kcc0003", capacity: "4", year: "2017", price: "40",  user: john }
# volskwagen = { brand: "Volskwagen", model: "Golf", location: "Köln Deutz", number_plate: "Kdd0003", capacity: "4", year: "2022", price: "25", user: john}

images = [
  'https://images.unsplash.com/photo-1494905998402-395d579af36f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1489824904134-891ab64532f1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1631&q=80',
  'https://images.unsplash.com/photo-1511919884226-fd3cad34687c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
  'https://images.unsplash.com/photo-1550355291-bbee04a92027?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80',
  'https://images.unsplash.com/flagged/photo-1553505192-acca7d4509be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1190&q=80',
  'https://images.unsplash.com/photo-1606152421802-db97b9c7a11b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1174&q=80',
  'https://images.unsplash.com/photo-1591230740238-e9a71182b67c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80',
  'https://images.unsplash.com/photo-1571224237891-bfb45fcf0920?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1339&q=80',
  'https://images.unsplash.com/photo-1661030190013-4d6d2a8d2c31?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  'https://images.unsplash.com/photo-1619767891037-8b71b1546c9f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'
]

# [bmw, mercedes, audi, volskwagen].each_with_index do |attributes, index|
#   file = URI.open(images[index])
#   car = Car.new(attributes)
#   car.photos.attach(io: file, filename: "car.png", content_type: "image/png")
#   car.save!
#   puts "Created #{car.brand}"
# end

10.times do |index|
  attributes = { brand: Faker::Vehicle.manufacture, model: Faker::Vehicle.make, location: Faker::Address.country, number_plate: Faker::Vehicle.license_plate, capacity: Faker::Vehicle.door_count, year: Faker::Vehicle.year, price: Faker::Number.within(range: 20..100), user: john }
  car = Car.new(attributes)
  file = URI.open(images[index])
  car.photos.attach(io: file, filename: "car.png", content_type: "image/png")
  car.save!
end
puts "Finished!"
