class CreateUserData < ActiveRecord::Migration[5.2]
  def change
    create_table :user_data do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.date :date
      t.integer :electricity_usage
      t.integer :petrol
      t.integer :user_points

      t.timestamps
    end
  end
end

# class AddFielsToUsers < ActiveRecord::Migration[5.2]
#   def change
#     add_column :users, :name, :string
#     add_column :users, :seurname, :string
#     add_column :users, :dob, :date
#     add_column :users, :post_code, :string
#     add_column :users, :email, :string
#     add_column :users, :lifetime_points, :integer
#   end
# end
