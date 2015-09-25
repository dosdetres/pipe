json.array!(@areas) do |area|
  json.extract! area, :id, :area, :description, :order, :active, :created_user_id, :updated_user_id, :customer_company_id, :area_id
  json.url area_url(area, format: :json)
end
