# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

# At each seed, we delate the content of the database
Task.destroy_all
Category.destroy_all
Email.destroy_all

# Categories for thursday's exercise
3.times do
  my_category = Category.create(title: Faker::Book.genre)
  3.times do
    my_task = Task.new(title: Faker::Book.title,
                      deadline: Faker::Date.forward(23),
                      image: Faker::Avatar.image)
    my_task.category = my_category
    my_task.save
  end
end

# We create mails
5.times do
	my_email = Email.create(object: Faker::Lorem.sentence(4),
													body: Faker::Lorem.paragraph(20),
                          wasread: false)
	puts "Email added"
end
