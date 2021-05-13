require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test "sign up" do
    user = User.new({
      :email => "test123@surrey.ac.uk",
      :password => "12345678",
      :password_confirmation => "12345678",
      :firstname => "John",
      :surname => "Oprin",
      :dob => "13/03/1999",
      :post_code => "GU2 7JW"
  })

  assert user.save, "User not signed up!"
  end

  # User update test
  test "user edit without password" do
    user = User.first
    new_data = {
      :email => "hafizbadrie@gmail.com",
    }
    new_data = ActionController::Parameters.new(new_data)
    new_data = new_data.permit(:email)
    user.update_without_password(new_data)

    assert_equal user.email, 'hafizbadrie@gmail.com', "User is not updated"
  end

  #Test user deletion
  test "user deletion" do
    user = User.second
    user.destroy
    deleted_user = User.second

    assert deleted_user.nil?, "User is not deleted"
  end


  test 'should not save user without email' do
    user = User.create({
      :password => "12345678",
      :password_confirmation => "12345678",
      :firstname => "John",
      :surname => "Oprin",
      :dob => "13/03/1999",
      :post_code => "GU2 7JW",
      :lifetime_points => 31
      })
    user.save
    refute user.valid?
  end

  test 'should not save user without password' do
    user = User.create({
      :email => "test123@surrey.ac.uk",
      :password_confirmation => "12345678",
      :firstname => "John",
      :surname => "Oprin",
      :dob => "13/03/1999",
      :post_code => "GU2 7JW",
      :lifetime_points => 31
      })
    user.save
    refute user.valid?
  end

  test 'should not save user without firstname' do
    user = User.create({
      :email => "test123@surrey.ac.uk",
      :password => "12345678",
      :password_confirmation => "12345678",
      :surname => "Oprin",
      :dob => "13/03/1999",
      :post_code => "GU2 7JW",
      :lifetime_points => 31
      })
    user.save
    refute user.valid?
  end

  test 'should not save user without surname' do
    user = User.create({
      :email => "test123@surrey.ac.uk",
      :password => "12345678",
      :password_confirmation => "12345678",
      :firstname => "John",
      :dob => "13/03/1999",
      :post_code => "GU2 7JW",
      })
    user.save
    refute user.valid?
  end

  test 'should not save user without dob' do
    user = User.create({
      :email => "test123@surrey.ac.uk",
      :password => "12345678",
      :password_confirmation => "12345678",
      :firstname => "John",
      :surname => "Oprin",
      :post_code => "GU2 7JW",
      })
    user.save
    refute user.valid?
  end

  test 'should not save user without post code' do
    user = User.create({
      :email => "test123@surrey.ac.uk",
      :password => "12345678",
      :password_confirmation => "12345678",
      :firstname => "John",
      :surname => "Oprin",
      :dob => "13/03/1999",
      })
    user.save
    refute user.valid?
  end

end
