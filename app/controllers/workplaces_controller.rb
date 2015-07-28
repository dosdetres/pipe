class WorkplacesController < ApplicationController
  before_action :set_workplace, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @workplaces = Workplace.all
    respond_with(@workplaces)
  end

  def show
    respond_with(@workplace)
  end

  def new
    @areas_options = Area.where(activo: true).map{|m| [ m.area , m.id ] }
    @workplace = Workplace.new
    respond_with(@workplace)
  end

  def edit
    @areas_options = Area.where(activo: true).map{|m| [ m.area , m.id ] }
  end

  def create
    @workplace = Workplace.new(workplace_params)
    unless current_user.nil?
      @workplace.created_user_id = current_user.id
    end
    flash[:notice] = 'Workplace was successfully created.' if @workplace.save
    respond_with(@workplace)
  end

  def update
    unless current_user.nil?
      @workplace.updated_user_id = current_user.id
    end
    flash[:notice] = 'Workplace was successfully updated.' if @workplace.update(workplace_params)
    respond_with(@workplace)
  end

  def destroy
    @workplace.destroy
    respond_with(@workplace)
  end

  private
    def set_workplace
      @workplace = Workplace.find(params[:id])
    end

    def workplace_params
      params.require(:workplace).permit(:puesto, :descripcion, :nivel_usuario, :activo, :area_id)
    end
end
