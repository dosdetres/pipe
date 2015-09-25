class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :first_last_name
      t.string :second_last_name
      t.string :rfc
      t.string :curp
      t.boolean :consortium
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
