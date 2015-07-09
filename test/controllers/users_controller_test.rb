require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { ApellidoMaterno: @user.ApellidoMaterno, ApellidoPaterno: @user.ApellidoPaterno, Bloqueado: @user.Bloqueado, Consorcio: @user.Consorcio, CorreoElectronico: @user.CorreoElectronico, Curp: @user.Curp, DiasVigenciaPassword: @user.DiasVigenciaPassword, EmpresaCliente_id: @user.EmpresaCliente_id, FechaCambioPassword: @user.FechaCambioPassword, FechaUltimoLogin: @user.FechaUltimoLogin, IntentosFallidosLogin: @user.IntentosFallidosLogin, Nombre: @user.Nombre, Password: @user.Password, Puesto_id: @user.Puesto_id, RequiereCambioPassword: @user.RequiereCambioPassword, Rfc: @user.Rfc, Usuario: @user.Usuario, UsuarioAlta_id: @user.UsuarioAlta_id, UsuarioCambio_id: @user.UsuarioCambio_id }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { ApellidoMaterno: @user.ApellidoMaterno, ApellidoPaterno: @user.ApellidoPaterno, Bloqueado: @user.Bloqueado, Consorcio: @user.Consorcio, CorreoElectronico: @user.CorreoElectronico, Curp: @user.Curp, DiasVigenciaPassword: @user.DiasVigenciaPassword, EmpresaCliente_id: @user.EmpresaCliente_id, FechaCambioPassword: @user.FechaCambioPassword, FechaUltimoLogin: @user.FechaUltimoLogin, IntentosFallidosLogin: @user.IntentosFallidosLogin, Nombre: @user.Nombre, Password: @user.Password, Puesto_id: @user.Puesto_id, RequiereCambioPassword: @user.RequiereCambioPassword, Rfc: @user.Rfc, Usuario: @user.Usuario, UsuarioAlta_id: @user.UsuarioAlta_id, UsuarioCambio_id: @user.UsuarioCambio_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
