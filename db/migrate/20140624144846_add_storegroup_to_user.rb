class AddStoregroupToUser < ActiveRecord::Migration
  def change
    add_column :users, :storegroup_id, :integer
  end
end
