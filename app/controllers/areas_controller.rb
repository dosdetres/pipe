class AreasController < ApplicationController
  before_action :set_area, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @areas = Area.all
    respond_with(@areas)
  end

  def show
    respond_with(@area)
  end

  def new
    @area = Area.new
    respond_with(@area)
  end

  def edit
  end

  def create
    @area = Area.new(area_params)
    flash[:notice] = 'Area was successfully created.' if @area.save
    respond_with(@area)
  end

  def update
    flash[:notice] = 'Area was successfully updated.' if @area.update(area_params)
    respond_with(@area)
  end

  def destroy
    @area.destroy
    respond_with(@area)
  end

  private
    def set_area
      @area = Area.find(params[:id])
    end

    def area_params
      params.require(:area).permit(:area, :descripcion, :orden, :activo, :created_user_id, :updated_user_id, :customer_company_id, :area_id)
    end
end
