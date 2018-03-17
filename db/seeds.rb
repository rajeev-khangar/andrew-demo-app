# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


100.times { User.create(email: Faker::Internet.email, password: 'demouser') }
puts "100 users created!!!"

GENRES = ['Jazz', 'Rock', 'Metal', 'Blues', 'Funk', 'Country', 'World', 'Art Punk',
 'Alternative Rock', 'College Rock']

GENRES.each { |title| Genre.where(title: title).first_or_create! }
puts "10 genres created!!!"

200.times { UsersGenre.where(user_id: User.limit(2).order("RANDOM()").last.id, genre_id: Genre.limit(2).order("RANDOM()").last.id).first_or_create! }
puts "100 users_genres created!!!"

