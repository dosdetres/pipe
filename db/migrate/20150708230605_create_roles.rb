class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :rol
      t.string :descripcion
      t.boolean :activo
      t.references :customer_company, index: true
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
