json.array!(@users) do |user|
  json.extract! user, :id, :EmpresaCliente_id, :Usuario, :Password, :Nombre, :ApellidoPaterno, :ApellidoMaterno, :Rfc, :Curp, :CorreoElectronico, :Puesto_id, :IntentosFallidosLogin, :RequiereCambioPassword, :DiasVigenciaPassword, :FechaCambioPassword, :Bloqueado, :FechaUltimoLogin, :Consorcio, :UsuarioAlta_id, :UsuarioCambio_id
  json.url user_url(user, format: :json)
end
