class CreateStoregroups < ActiveRecord::Migration
  def change
    create_table :storegroups do |t|
      t.string :name
      t.string :area

      t.timestamps
    end
  end
end
