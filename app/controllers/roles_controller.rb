class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /roles
  # GET /roles.json
  def index
    @roles = Role.all
    #respond_with(@roles)
  end

  def show
    #respond_with(@role)
  end

  def new
    #@role = Role.new
    #respond_with(@role)
    @roles_companies_options = CustomerCompany.where("activo = 1").map{|m| [ m.empresa_cliente , m.id ] }
    @user = User.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)
    flash[:notice] = 'Role was successfully created.' if @role.save
    respond_with(@role)
  end

  def update
    flash[:notice] = 'Role was successfully updated.' if @role.update(role_params)
    respond_with(@role)
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:rol, :descripcion, :activo, :customer_company_id, :created_user_id, :updated_user_id)
    end
end
