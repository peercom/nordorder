class AddFulfillmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fulfillment, :boolean, :default => false
  end
end
