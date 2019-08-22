# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do

	event = Event.create(

		start_date: DateTime.now + rand(1..100) , 

		duration: 5*rand(4..10) , 

		title: Faker::Creature::Dog.sound, 

		description: Faker::Hacker.say_something_smart,

		price: rand(1..1000),

		location: Faker::Books::Dune.planet,

		admin_id: User.all.sample.id )

end


