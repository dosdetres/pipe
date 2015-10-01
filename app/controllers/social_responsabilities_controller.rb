class SocialResponsabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_social_responsability, only: [:edit, :update, :destroy]

  def new
    @model = SocialResponsability.new
  end

  def edit
  end

  def create
    @model = SocialResponsability.new(social_responsability_params)
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
      if @model.update(social_responsability_params)
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
  def set_social_responsability
    @model = CustomerCompany.find(current_user.customer_company.id).social_responsability
  end

  def social_responsability_params
    params.require(:social_responsability).permit(:text)
  end
end