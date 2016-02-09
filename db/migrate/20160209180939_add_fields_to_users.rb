class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string, null: false, default: ""
    add_column :users, :last_name, :string, null: false, default: ""
    add_column :users, :city, :string, null: false, default: ""
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
  end
end
