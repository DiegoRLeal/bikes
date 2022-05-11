# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Offer.destroy_all
10.times do
  Offer.create!(
    bike: ['Abus', 'Adidas', 'Nalgene', 'NAMEDSport', 'Oakley', 'Panaracer', 'Park', 'Radial', 'Raleigh'].sample,
    localization: Faker::Address.city,
    price: rand(20..100),
    bike_condition: ['new', 'used', 'under maintenance'].sample,
    available: ['true', 'false'].sample
  )
end
