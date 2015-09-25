class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :role
      t.string :description
      t.boolean :active
      t.references :customer_company, index: true
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
