# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Car.destroy_all

john = User.create(first_name: "John", last_name: "Smith", email: "user1@aol.com", address: "Köln")

puts "Creating Cars"
bmw = { brand: "Bmw", model: "Serie 3", location: "Ruldorfplatz", number_plate: "Kaa7586", capacity: "5", year: "2018", price: "35", user: john }
mercedes = { brand: "Mercedes", model: "A1", location: "Zulpicheplatz", number_plate: "Kbb0002", capacity: "4", year: "2020", price: "30", user: john }
audi = { brand: "Audi", model: "A5", location: "Barbarossaplatz", number_plate: "Kcc0003", capacity: "4", year: "2017", price: "40",  user: john }
volskwagen = { brand: "Volskwagen", model: "Golf", location: "Deutz", number_plate: "Kdd0003", capacity: "4", year: "2022", price: "25", user: john}

[bmw, mercedes, audi, volskwagen].each do |attributes|
  car = Car.create!(attributes)
  puts "Created #{car.brand}"
end
puts "Finished!"
