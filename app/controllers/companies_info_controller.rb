class CompaniesInfoController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer_company, only: [:belief]

  def belief
    if @customer_company.belief.nil?
      redirect_to new_belief_path
    else
      redirect_to edit_belief_path
    end
  end

  private

  def set_customer_company
    @customer_company = CustomerCompany.find(current_user.customer_company.id)
  end
end