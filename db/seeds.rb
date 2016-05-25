# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = ['drama', 'comedy', 'thriller/horror', 'musical', 'action/adventure', 'documentary']

categories.each do | category |
  Category.create(name: category )
end

10.times do
  User.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', judge: true, judge_token: '0000' )
  User.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password', organizer: true, organizer_token: '0000' )
  User.create( first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: 'password')
end

cat = Category.find_by( name: categories.sample )

15.times do
  Film.create(name: Faker::Superhero.name, description: Faker::Hipster.paragraphs(1), category_id: cat.id )
end

20.times do
  Review.create(title: Faker::StarWars.specie, body: Faker::StarWars.quote, film_id: Film.all.sample.id, user_id: User.all.sample.id )
end
