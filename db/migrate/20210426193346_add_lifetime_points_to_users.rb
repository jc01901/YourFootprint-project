class AddLifetimePointsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :lifetime_points, :integer
  end
end
