class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer , m.id ] }
    @workplaces_options = Workplace.where(active: true).map{|m| [ m.position , m.id ] }
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer , m.id ] }
    @workplaces_options = Workplace.where(active: true).map{|m| [ m.position , m.id ] }
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    unless current_user.nil?
      @user.created_user_id = current_user.id
    end
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'The user was created successfully.' }
        format.json { render :show, status: :created, location: @user }
      else
        @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer , m.id ] }
        @workplaces_options = Workplace.where(active: true).map{|m| [ m.position , m.id ] }
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    @user.updated_user_id = current_user.id
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'The User updated successfully.' }
        format.json { render :show, status: :ok, location: @user }
      else
        @customer_companies_options = CustomerCompany.where(active: true).map{|m| [ m.company_customer , m.id ] }
        @workplaces_options = Workplace.where(active: true).map{|m| [ m.position , m.id ] }
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'The user was removed successfully.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :first_last_name, :second_last_name, :rfc, :curp, :consortium, :email, :password, :password_confirmation, :customer_company_id, :workplace_id)
    end
end
