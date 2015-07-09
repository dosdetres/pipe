class CreateWorkplaces < ActiveRecord::Migration
  def change
    create_table :workplaces do |t|
      t.string :puesto
      t.string :descripcion
      t.integer :nivel_usuario
      t.boolean :activo
      t.references :area, index: true
      t.integer :created_user_id
      t.string :updated_user_id

      t.timestamps
    end
  end
end
