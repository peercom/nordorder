class AddConfirmedToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :confirmed, :boolean, :default => false
  end
end
