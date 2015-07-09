json.array!(@roles) do |role|
  json.extract! role, :id, :rol, :descripcion, :activo, :customer_company_id, :created_user_id, :updated_user_id
  json.url role_url(role, format: :json)
end
