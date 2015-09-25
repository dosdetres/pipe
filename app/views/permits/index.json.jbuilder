json.array!(@permits) do |permit|
  json.extract! permit, :id, :role_id, :menu_option_id, :add, :update, :delete, :execute, :generate, :upload, :authorize, :created_user_id, :updated_user_id
  json.url permit_url(permit, format: :json)
end
