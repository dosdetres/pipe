class SustainabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sustainability, only: [:edit, :update, :destroy]

  def new
    @model = Sustainability.new
  end

  def edit
  end

  def create
    @model = Sustainability.new(sustainability_params)
    unless current_user.nil?
      @model.customer_company_id = current_user.customer_company_id
      @model.created_user_id = current_user.id
    end
    respond_to do |format|
      if @model.save
        format.html { render :edit }
        flash[:notice] = t("controllers.create_success")
      else
        format.html { render :new }
      end
    end
  end

  def update
    unless current_user.nil?
      @model.updated_user_id = current_user.id
    end
    respond_to do |format|
      if @model.update(sustainability_params)
        format.html { render :edit }
        flash[:notice] = t("controllers.update_success")
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @model.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: t("controllers.destroy_success") }
    end
  end

  private
  def set_sustainability
    @model = CustomerCompany.find(current_user.customer_company.id).sustainability
  end

  def sustainability_params
    params.require(:sustainability).permit(:text)
  end
end