class MenuOptionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_menu_option, only: [:show, :edit, :update, :destroy]

  # GET /menu_options
  # GET /menu_options.json
  def index
    @menu_options = MenuOption.all
  end

  # GET /menu_options/1
  # GET /menu_options/1.json
  def show
  end

  # GET /menu_options/new
  def new
    @menu_options_options = MenuOption.where(active: true).map{|m| [ m.module , m.id ] }
    @menu_option = MenuOption.new
  end

  # GET /menu_options/1/edit
  def edit
    @menu_options_options = MenuOption.where(active: true).map{|m| [ m.module , m.id ] }
  end

  # POST /menu_options
  # POST /menu_options.json
  def create
    @menu_option = MenuOption.new(menu_option_params)
    unless current_user.nil?
      @menu_option.created_user_id = current_user.id
    end
    respond_to do |format|
      if @menu_option.save
        format.html { redirect_to @menu_option, notice: t("controllers.create_success") }
        format.json { render :show, status: :created, location: @menu_option }
      else
        @menu_options_options = MenuOption.where(active: true).map{|m| [ m.module , m.id ] }
        format.html { render :new }
        format.json { render json: @menu_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_options/1
  # PATCH/PUT /menu_options/1.json
  def update
    unless current_user.nil?
      @menu_option.updated_user_id = current_user.id
    end
    respond_to do |format|
      if @menu_option.update(menu_option_params)
        format.html { redirect_to @menu_option, notice: t("controllers.update_success") }
        format.json { render :show, status: :ok, location: @menu_option }
      else
        @menu_options_options = MenuOption.where(active: true).map{|m| [ m.module , m.id ] }
        format.html { render :edit }
        format.json { render json: @menu_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_options/1
  # DELETE /menu_options/1.json
  def destroy
    @menu_option.destroy
    respond_to do |format|
      format.html { redirect_to menu_options_url, notice: t("controllers.destroy_success") }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_option
      @menu_option = MenuOption.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_option_params
      params.require(:menu_option).permit(:module, :description, :order, :path, :image, :consortium, :active, :menu_option_id)
    end
end
