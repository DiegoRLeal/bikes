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
    bike: ['Abus (42)', 'adidas (6)', 'Nalgene (2)', 'NAMEDSport (4)', 'Oakley (28)', 'Panaracer (10)', 'Park (7)', 'Radial (6)', 'Raleigh (71)'].sample,
    localization: Faker::Address.city,
    price: rand(20..100),
    bike_condition: ['new', 'used', 'under maintenance'].sample
  )
end
