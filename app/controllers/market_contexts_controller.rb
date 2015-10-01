class MarketContextsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_market_context, only: [:edit, :update, :destroy]

  def new
    @model = MarketContext.new
  end

  def edit
  end

  def create
    @model = MarketContext.new(market_context_params)
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
      if @model.update(market_context_params)
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
  def set_market_context
    @model = CustomerCompany.find(current_user.customer_company.id).market_context
  end

  def market_context_params
    params.require(:market_context).permit(:text)
  end
end