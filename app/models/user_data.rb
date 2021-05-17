class UserData < ApplicationRecord
  belongs_to :user
  validates_presence_of :electricity_usage, :petrol, :user_points

end
