require 'faker'

User.destroy_all
Todo.destroy_all

# Create users
5.times do
  user = User.new(
  name:       Faker::Name.name,
  email:      Faker::Internet.email,
  password:   Faker::Lorem.characters(10),
  )
  
  user.skip_confirmation!
  user.save
end

users = User.all

# Create To-Dos
5.times do
  Todo.create!(
  user:         users.sample,
  description:  Faker::Lorem.sentence
  )
end

