class LifetimePointsMakeNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :lifetime_points, :integer, null: false, default: 0
  end
end
