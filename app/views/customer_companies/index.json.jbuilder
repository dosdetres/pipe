json.array!(@customer_companies) do |customer_company|
  json.extract! customer_company, :id, :EmpresaCliente, :Rfc, :RazonSocial, :Consorcio, :EmpresaCliente_id, :Activo, :UsuarioAlta_id, :UsuarioCambio_id
  json.url customer_company_url(customer_company, format: :json)
end
