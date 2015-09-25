json.array!(@customer_companies) do |customer_company|
  json.extract! customer_company, :id, :CompanyCustomer, :Rfc, :RegisteredName, :Consortium, :CompanyCustomer_id, :Active, :CreatedUser_id, :UpdatedUser_id
  json.url customer_company_url(customer_company, format: :json)
end
