class RolesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer , m.id ] }
    @role = Role.new
  end

  def edit
    @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer , m.id ] }
  end

  def create
    @role = Role.new(role_params)
    unless current_user.nil?
      @role.created_user_id = current_user.id
    end
    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: t("controllers.create_success") }
        format.json { render :show, status: :created, location: @role }
      else
        @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer, m.id ] }
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    unless current_user.nil?
      @role.updated_user_id = current_user.id
    end
    respond_to do |format|
      if @role.update(role_params)
        format.html { redirect_to @role, notice: t("controllers.update_success") }
        format.json { render :show, status: :ok, location: @role }
      else
        @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer , m.id ] }
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @role.destroy
    respond_to do |format|
      format.html { redirect_to roles_url, notice: t("controllers.destroy_success") }
      format.json { head :no_content }
    end
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:role, :description, :active, :customer_company_id)
    end
end
