class AddWorkplaceToUsers < ActiveRecord::Migration
  def self.up
    # remove_column :users, :position_id
    add_reference :users, :workplace, index: true
  end

  def self.down
    remove_column :users, :workplace_id
  end
end
