# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create({
  :email => "admin@surrey.ac.uk",
  :password => "12345678",
  :password_confirmation => "12345678",
  :firstname => "John",
  :surname => "Johnson",
  :dob => "13/03/1999",
  :post_code => "GU2 7JW"
})

user1.user_data.create({
  :date => "01/01/2021",
  :electricity_usage => 300,
  :petrol => 500,
  :user_points => 10
})

user1.user_data.create({
  :date => "01/02/2021",
  :electricity_usage => 341,
  :petrol => 350,
  :user_points => 21
})
user1.save!


user2 = User.create({
  :email => "adam@surrey.ac.uk",
  :password => "12345678",
  :password_confirmation => "12345678",
  :firstname => "Adam",
  :surname => "Wall",
  :dob => "13/03/1999",
  :post_code => "GU2 I4L"
})

user2.user_data.create({
  :date => "15/02/2021",
  :electricity_usage => 100,
  :petrol => 200,
  :user_points => 16
})
user2.save!
