class AreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def index
    @areas = Area.all
  end

  def show
  end

  def new
    @customer_companies_options = CustomerCompany.where(activo: true).map{|m| [ m.empresa_cliente , m.id ] }
    @areas_options = Area.where(activo: true).map{|m| [ m.area , m.id ] }
    @area = Area.new
  end

  def edit
    @customer_companies_options = CustomerCompany.where(activo: true).map{|m| [ m.empresa_cliente , m.id ] }
    @areas_options = Area.where(activo: true).map{|m| [ m.area , m.id ] }
  end

  def create
    @area = Area.new(area_params)
    unless current_user.nil?
      @area.created_user_id = current_user.id
    end
    respond_to do |format|
      if @area.save
        format.html { redirect_to @area, notice: 'El Área se creó correctamente.' }
        format.json { render :show, status: :created, location: @area }
      else
        @customer_companies_options = CustomerCompany.where(activo: true).map{|m| [ m.empresa_cliente , m.id ] }
        @areas_options = Area.where(activo: true).map{|m| [ m.area , m.id ] }
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    unless current_user.nil?
      @area.updated_user_id = current_user.id
    end
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'El Área se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @area }
      else
        @customer_companies_options = CustomerCompany.where(activo: true).map{|m| [ m.empresa_cliente , m.id ] }
        @areas_options = Area.where(activo: true).map{|m| [ m.area , m.id ] }
        format.html { render :edit }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @area.destroy
    respond_to do |format|
      format.html { redirect_to areas_url, notice: 'El Área se eliminó correctamente.' }
      format.json { head :no_content }
    end
  end

  private
    def set_area
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(:area, :descripcion, :orden, :activo, :customer_company_id, :area_id)
    end
end
