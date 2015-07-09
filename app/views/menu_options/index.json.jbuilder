json.array!(@menu_options) do |menu_option|
  json.extract! menu_option, :id, :Modulo, :Descripcion, :Orden, :Ruta, :Imagen, :Consorcio, :Modulo_id, :Activo, :UsuarioAlta_id, :UsuarioCambio_id
  json.url menu_option_url(menu_option, format: :json)
end
