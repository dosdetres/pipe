class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_role, only: [:show, :edit, :update, :destroy]

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
    @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)
    unless current_user.nil?
      @role.created_user_id = current_user.id
    end
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'El Rol se creó correctamente.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @role.updated_user_id = current_user.id
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: 'El Rol se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: 'El Rol se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:rol, :descripcion, :activo, :customer_company_id, :created_user_id, :updated_user_id)
    end
end
