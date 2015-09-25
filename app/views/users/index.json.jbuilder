json.array!(@users) do |user|
  json.extract! user, :Id, :Name, :FirstLastName, :SecondLastName, :Rfc, :Curp, :Consortium, :Created_user_id, :Updated_user_id, :Created_at, :Updated_at, :Email, :Encrypted_password, :Reset_password_token, :Reset_password_sent_at, :Remember_created_at, :Sign_in_count, :Current_sign_in_at, :Last_sign_in_at, :Current_sign_in_ip, :Last_sign_in_ip, :Customer_company_id, :Workplace_id
  json.url user_url(user, format: :json)
end
