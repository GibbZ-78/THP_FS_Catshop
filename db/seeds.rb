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
	User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: "THP2022", email: "kittenmail_" + x.to_s + "@yopmail.com", birthdate: Faker::Date.birthday(min_age: 16, max_age: 100))
	puts "  > User n°: #{User.all.last.id} - first_name: #{User.all.last.first_name} - last_name: #{User.all.last.last_name} - email: #{User.all.last.email} - password: #{User.all.last.encrypted_password} - birthdate: #{User.all.last.birthdate}"
end
puts "  > Finished seeding users"

# Création de items
puts
puts "SEEDING - Creation of some fake items"
puts
20.times do |x|
	Item.create(title: "Chat n° :"+ x.to_s, description: Faker::Lorem.paragraph(sentence_count: 3), price: rand(8.0..99.0).round(2), image_url: "image_"+ x.to_s + ".jpg")
 	puts "  > Item n°: #{Item.all.last.id} - title: #{Item.all.last.title} - description: #{Item.all.last.description[0..20]} - price: #{Item.all.last.price} - image: #{Item.all.last.image_url}"
end
puts "  > Finished seeding items"

puts "Ending seeding"