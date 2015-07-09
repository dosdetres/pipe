class AddMenuOptionToMenuOptions < ActiveRecord::Migration
  def self.up
    add_reference :menu_options, :menu_option, index: true
  end

  def self.down
    remove_column :menu_options, :menu_option_id
  end

end
