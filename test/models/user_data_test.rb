require 'test_helper'

class UserDataTest < ActiveSupport::TestCase

  test 'should not save without electricity_usage' do
    record = UserData.create({
      :petrol => 350,
      :user_points => 25,
      })
    record.save
    refute record.valid?
  end

  test 'should not save without petrol' do
    record = UserData.create({
      :electricity_usage => 350,
      :user_points => 25,
      })
    record.save
    refute record.valid?
  end

  test 'should not save without user_points' do
    record = UserData.create({
      :petrol => 350,
      :electricity_usage => 25,
      })
    record.save
    refute record.valid?
  end
end
