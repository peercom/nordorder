class AddAddressesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :store, :string
    add_column :users, :address, :string
  end
end
