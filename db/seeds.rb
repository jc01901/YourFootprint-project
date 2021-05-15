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
  :post_code => "GU2 7JW",
  :lifetime_points => 31
})

user1.user_data.create({
  :date => "01/01/2021",
  :electricity_usage => 300,
  :petrol => 500,
  :user_points => 10
})

user1.user_data.create({
  :date => DateTime.current - 1,
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
  :post_code => "GU2 I4L",
  :lifetime_points => 26
})

user2.user_data.create({
  :date => DateTime.current - 2,
  :electricity_usage => 100,
  :petrol => 200,
  :user_points => 16
})

user2.user_data.create({
  :date => DateTime.current - 1,
  :electricity_usage => 100,
  :petrol => 200,
  :user_points => 10
})

user2.save!

user3 = User.create({
  :email => "admin2@surrey.ac.uk",
  :password => "12345678",
  :password_confirmation => "12345678",
  :firstname => "David",
  :surname => "Davis",
  :dob => "23/04/1998",
  :post_code => "GU2 7JW",
  :lifetime_points => 46
})

user3.user_data.create({
  :date => "15/02/2021",
  :electricity_usage => 100,
  :petrol => 200,
  :user_points => 16
})

user3.user_data.create({
  :date => DateTime.current - 1,
  :electricity_usage => 150,
  :petrol => 200,
  :user_points => 30
})
user3.save!