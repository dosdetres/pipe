json.array!(@permits) do |permit|
  json.extract! permit, :id, :role_id, :menu_option_id, :registrar, :actualizar, :eliminar, :ejecutar_procesos, :generar_archivos, :cargar_archivos, :autorizar, :created_user_id, :updated_user_id
  json.url permit_url(permit, format: :json)
end
