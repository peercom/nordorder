class RenameProductsPrice < ActiveRecord::Migration
  def change
    rename_column :products, :price, :price_cents
  end
end
