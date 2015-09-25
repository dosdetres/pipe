class CustomerCompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer_company, only: [:show, :edit, :update, :destroy]

  # GET /customer_companies
  # GET /customer_companies.json
  def index
    @customer_companies = CustomerCompany.all
  end

  # GET /customer_companies/1
  # GET /customer_companies/1.json
  def show
  end

  # GET /customer_companies/new
  def new
    @customer_companies_options = CustomerCompany.where(active: true, consortium: true).map{|m| [ m.company_customer , m.id ] }
    @customer_company = CustomerCompany.new
  end

  # GET /customer_companies/1/edit
  def edit
    @customer_companies_options = CustomerCompany.where(active: true, consortium: true).map{|m| [ m.company_customer , m.id ] }
  end

  # POST /customer_companies
  # POST /customer_companies.json
  def create
    @customer_company = CustomerCompany.new(customer_company_params)
    @customer_company.created_user_id = current_user.id
    respond_to do |format|
      if @customer_company.save
        format.html { redirect_to @customer_company, notice: 'The Company was successfully created.' }
        format.json { render :show, status: :created, location: @customer_company }
      else
        @customer_companies_options = CustomerCompany.where(active: true, consortium: true).map{|m| [ m.company_customer , m.id ] }
        format.html { render :new }
        format.json { render json: @customer_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer_companies/1
  # PATCH/PUT /customer_companies/1.json
  def update
    @customer_company.updated_user_id = current_user.id
    respond_to do |format|
      if @customer_company.update(customer_company_params)
        format.html { redirect_to @customer_company, notice: 'The Company successfully updated.' }
        format.json { render :show, status: :ok, location: @customer_company }
      else
        @customer_companies_options = CustomerCompany.where(active: true, consortium: true).map{|m| [ m.company_customer , m.id ] }
        format.html { render :edit }
        format.json { render json: @customer_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer_companies/1
  # DELETE /customer_companies/1.json
  def destroy
    @customer_company.destroy
    respond_to do |format|
      format.html { redirect_to customer_companies_url, notice: 'The Company successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_company
      @customer_company = CustomerCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_company_params
      params.require(:customer_company).permit(:company_customer, :rfc, :registered_name, :consortium, :active, :customer_company_id)
    end
end
