class CreateMenuOptions < ActiveRecord::Migration
  def change
    create_table :menu_options do |t|
      t.string :module
      t.string :description
      t.integer :order
      t.string :path
      t.string :image
      t.boolean :consortium
      t.boolean :active
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end

