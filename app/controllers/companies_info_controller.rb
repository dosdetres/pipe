class CompaniesInfoController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer_company, only: [:belief, :external_context, :global_strategy, :growth_vector, :growth_vector_detail, :internal_context, :market_context, :opportunity, :risk, :social_responsability, :sustainability]

  def belief
    if @customer_company.belief.nil?
      redirect_to new_belief_path
    else
      redirect_to edit_belief_path
    end
  end

  def external_context
    if @customer_company.external_context.nil?
      redirect_to new_external_context_path
    else
      redirect_to edit_external_context_path
    end
  end

  def global_strategy
    if @customer_company.global_strategy.nil?
      redirect_to new_global_strategy_path
    else
      redirect_to edit_global_strategy_path
    end
  end

  def growth_vector
    if @customer_company.growth_vector.nil?
      redirect_to new_growth_vector_path
    else
      redirect_to edit_growth_vector_path
    end
  end

  def growth_vector_detail
    if @customer_company.growth_vector_detail.nil?
      redirect_to new_growth_vector_detail_path
    else
      redirect_to edit_growth_vector_detail_path
    end
  end

  def internal_context
    if @customer_company.internal_context.nil?
      redirect_to new_internal_context_path
    else
      redirect_to edit_internal_context_path
    end
  end

  def market_context
    if @customer_company.market_context.nil?
      redirect_to new_market_context_path
    else
      redirect_to edit_market_context_path
    end
  end

  def opportunity
    if @customer_company.opportunity.nil?
      redirect_to new_opportunity_path
    else
      redirect_to edit_opportunity_path
    end
  end

  def risk
    if @customer_company.risk.nil?
      redirect_to new_risk_path
    else
      redirect_to edit_risk_path
    end
  end

  def social_responsability
    if @customer_company.social_responsability.nil?
      redirect_to new_social_responsability_path
    else
      redirect_to edit_social_responsability_path
    end
  end

  def sustainability
    if @customer_company.sustainability.nil?
      redirect_to new_sustainability_path
    else
      redirect_to edit_sustainability_path
    end
  end

  private

  def set_customer_company
    @customer_company = CustomerCompany.find(current_user.customer_company.id)
  end
end