class AddFieldsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :firstname, :string
    add_column :users, :surname, :string
    add_column :users, :dob, :date
    add_column :users, :post_code, :string
  end
end
