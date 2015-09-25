json.array!(@menu_options) do |menu_option|
  json.extract! menu_option, :id, :Module, :Description, :Order, :Path, :Image, :Consortium, :Module_id, :Active, :CreatedUser_id, :UpdatedUser_id
  json.url menu_option_url(menu_option, format: :json)
end
