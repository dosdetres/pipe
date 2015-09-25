class WorkplacesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_workplace, only: [:show, :edit, :update, :destroy]

  def index
    @workplaces = Workplace.all
  end

  def show
  end

  def new
    @areas_options = Area.where(active: true).map{|m| [ m.area , m.id ] }
    @workplace = Workplace.new
  end

  def edit
    @areas_options = Area.where(active: true).map{|m| [ m.area , m.id ] }
  end

  def create
    @workplace = Workplace.new(workplace_params)
    unless current_user.nil?
      @workplace.created_user_id = current_user.id
    end
    respond_to do |format|
      if @workplace.save
        format.html { redirect_to @workplace, notice: 'The position was successfully created.' }
        format.json { render :show, status: :created, location: @workplace }
      else
        @areas_options = Area.where(active: true).map{|m| [ m.area , m.id ] }
        format.html { render :new }
        format.json { render json: @workplace.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    unless current_user.nil?
      @workplace.updated_user_id = current_user.id
    end
    respond_to do |format|
      if @workplace.update(workplace_params)
        format.html { redirect_to @workplace, notice: 'The position was successfully updated.' }
        format.json { render :show, status: :ok, location: @workplace }
      else
        @areas_options = Area.where(active: true).map{|m| [ m.area , m.id ] }
        format.html { render :edit }
        format.json { render json: @workplace.errors, status: :unprocessable_entity }
      end
    end
    #flash[:notice] = 'Workplace was successfully updated.' if @workplace.update(workplace_params)
    #respond_with(@workplace)
  end

  def destroy
    @workplace.destroy
    respond_to do |format|
      format.html { redirect_to workplaces_url, notice: 'The position was successfully removed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_workplace
      @workplace = Workplace.find(params[:id])
    end

    def workplace_params
      params.require(:workplace).permit(:position, :description, :user_level, :active, :area_id)
    end
end
