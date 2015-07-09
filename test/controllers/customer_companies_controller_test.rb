require 'test_helper'

class CustomerCompaniesControllerTest < ActionController::TestCase
  setup do
    @customer_company = customer_companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_company" do
    assert_difference('CustomerCompany.count') do
      post :create, customer_company: { Activo: @customer_company.Activo, Consorcio: @customer_company.Consorcio, EmpresaCliente: @customer_company.EmpresaCliente, EmpresaCliente_id: @customer_company.EmpresaCliente_id, RazonSocial: @customer_company.RazonSocial, Rfc: @customer_company.Rfc, UsuarioAlta_id: @customer_company.UsuarioAlta_id, UsuarioCambio_id: @customer_company.UsuarioCambio_id }
    end

    assert_redirected_to customer_company_path(assigns(:customer_company))
  end

  test "should show customer_company" do
    get :show, id: @customer_company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_company
    assert_response :success
  end

  test "should update customer_company" do
    patch :update, id: @customer_company, customer_company: { Activo: @customer_company.Activo, Consorcio: @customer_company.Consorcio, EmpresaCliente: @customer_company.EmpresaCliente, EmpresaCliente_id: @customer_company.EmpresaCliente_id, RazonSocial: @customer_company.RazonSocial, Rfc: @customer_company.Rfc, UsuarioAlta_id: @customer_company.UsuarioAlta_id, UsuarioCambio_id: @customer_company.UsuarioCambio_id }
    assert_redirected_to customer_company_path(assigns(:customer_company))
  end

  test "should destroy customer_company" do
    assert_difference('CustomerCompany.count', -1) do
      delete :destroy, id: @customer_company
    end

    assert_redirected_to customer_companies_path
  end
end
