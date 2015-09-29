class PermitsController < ApplicationController
  before_action :set_permit, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @permits = Permit.all
    respond_with(@permits)
  end

  def show
    respond_with(@permit)
  end

  def new
    @permit = Permit.new
    respond_with(@permit)
  end

  def edit
  end

  def create
    @permit = Permit.new(permit_params)
    flash[:notice] = t("controllers.create_success") if @permit.save
    respond_with(@permit)
  end

  def update
    flash[:notice] = t("controllers.update_success") if @permit.update(permit_params)
    respond_with(@permit)
  end

  def destroy
    @permit.destroy
    flash[:notice] = t("controllers.destroy_success")
    respond_with(@permit)
  end

  private
    def set_permit
      @permit = Permit.find(params[:id])
    end

    def permit_params
      params.require(:permit).permit(:role_id, :menu_option_id, :add, :update, :delete, :execute, :generate, :upload, :authorize, :created_user_id, :updated_user_id)
    end
end
