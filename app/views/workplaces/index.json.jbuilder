json.array!(@workplaces) do |workplace|
  json.extract! workplace, :id, :puesto, :descripcion, :nivel_usuario, :activo, :area_id, :created_user_id, :updated_user_id
  json.url workplace_url(workplace, format: :json)
end
