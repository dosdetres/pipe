class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.string :position
      t.string :description
      t.integer :user_level
      t.boolean :active
      t.references :area, index: true
      t.integer :created_user_id
      t.string :updated_user_id

      t.timestamps
    end
  end
end
