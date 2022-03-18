# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# (c) Wilfried PAILLOT - Efface le contenu de toutes les tables du model et remet à zéro les compteurs (gem database_cleaner)
DatabaseCleaner.clean_with(:truncation)

# Création de users
puts
puts "SEEDING - Creation of some fake users"
puts
5.times do |x|
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "THP2022", email: "kittenmail_" + (x+1).to_s + "@yopmail.com", birthdate: Faker::Date.birthday(min_age: 16, max_age: 100))
	puts "  > User n°: #{User.last.id} - first_name: #{User.last.first_name} - last_name: #{User.last.last_name} - email: #{User.last.email} - password: #{User.last.encrypted_password} - birthdate: #{User.last.birthdate}"
end
puts "  > Finished seeding users"

#Admin creation
puts "  > Seeding admin info"
User.create(role: 1, first_name: "Admin", last_name: "Administrator", password: "THP2022", email: "adminvocal46@yopmail.com", birthdate: Faker::Date.birthday(min_age: 16, max_age: 100))
puts "  > Finished seeding admin"

# Création de items
puts
puts "SEEDING - Creation of some fake items"
puts
20.times do |x|
	Item.create(title: Faker::Games::Pokemon.name, description: Faker::Lorem.paragraph(sentence_count: 3), price: rand(8.0..99.0).round(2), image_url: "image_" + (x+1).to_s + ".jpg")
 	puts "  > Item n°: #{Item.last.id} - title: #{Item.last.title} - description: #{Item.last.description[0..20]} - price: #{Item.last.price} - image: #{Item.last.image_url}"
end
puts "  > Finished seeding items"
puts
puts "SEEDING - This is the end..."