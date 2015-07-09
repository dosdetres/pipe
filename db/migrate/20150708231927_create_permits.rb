class CreatePermits < ActiveRecord::Migration
  def change
    create_table :permits do |t|
      t.references :role, index: true
      t.references :menu_option, index: true
      t.boolean :registrar
      t.boolean :actualizar
      t.boolean :eliminar
      t.boolean :ejecutar_procesos
      t.boolean :generar_archivos
      t.boolean :cargar_archivos
      t.boolean :autorizar
      t.integer :created_user_id
      t.integer :updated_user_id

      t.timestamps
    end
  end
end
