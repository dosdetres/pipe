class AreasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  def index
    @areas = Area.all
  end

  def show
  end

  def new
    @area = Area.new
  end

  def edit
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
        format.html { render :new }
        format.json { render json: @area.errors, status: :unprocessable_entity }
      end
    end


  end

  def update
    @area.updated_user_id = current_user.id
    respond_to do |format|
      if @area.update(area_params)
        format.html { redirect_to @area, notice: 'El Área se actualizo correctamente.' }
        format.json { render :show, status: :ok, location: @area }
      else
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
      params.require(:area).permit(:area, :descripcion, :orden, :activo, :created_user_id, :updated_user_id, :customer_company_id, :area_id)
    end
end
