require 'test_helper'

class MenuOptionsControllerTest < ActionController::TestCase
  setup do
    @menu_option = menu_options(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_options)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_option" do
    assert_difference('MenuOption.count') do
      post :create, menu_option: { Activo: @menu_option.Activo, Consorcio: @menu_option.Consorcio, Descripcion: @menu_option.Descripcion, Imagen: @menu_option.Imagen, Modulo: @menu_option.Modulo, Modulo_id: @menu_option.Modulo_id, Orden: @menu_option.Orden, Ruta: @menu_option.Ruta, UsuarioAlta_id: @menu_option.UsuarioAlta_id, UsuarioCambio_id: @menu_option.UsuarioCambio_id }
    end

    assert_redirected_to menu_option_path(assigns(:menu_option))
  end

  test "should show menu_option" do
    get :show, id: @menu_option
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @menu_option
    assert_response :success
  end

  test "should update menu_option" do
    patch :update, id: @menu_option, menu_option: { Activo: @menu_option.Activo, Consorcio: @menu_option.Consorcio, Descripcion: @menu_option.Descripcion, Imagen: @menu_option.Imagen, Modulo: @menu_option.Modulo, Modulo_id: @menu_option.Modulo_id, Orden: @menu_option.Orden, Ruta: @menu_option.Ruta, UsuarioAlta_id: @menu_option.UsuarioAlta_id, UsuarioCambio_id: @menu_option.UsuarioCambio_id }
    assert_redirected_to menu_option_path(assigns(:menu_option))
  end

  test "should destroy menu_option" do
    assert_difference('MenuOption.count', -1) do
      delete :destroy, id: @menu_option
    end

    assert_redirected_to menu_options_path
  end
end
