class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nombre
      t.string :apellido_paterno
      t.string :apellido_materno
      t.string :rfc
      t.string :curp
      t.integer :puesto_id
      t.boolean :consorcio
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
