class CreateMenuOptions < ActiveRecord::Migration
  def change
    create_table :menu_options do |t|
      t.string :modulo
      t.string :descripcion
      t.integer :orden
      t.string :ruta
      t.string :imagen
      t.boolean :consorcio
      t.boolean :activo
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end

