class HallsController < ApplicationController
before_action :set_hall, only: %i[show]

  def index
    @halls = Hall.all
  end

  def new
    @hall = Hall.new
  end

  def create
    @hall = Hall.new(hall_params)

    if @hall.save
      redirect_to halls_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show;  end

  private
  def set_hall
    @hall = Hall.find(params[:id])
  end

  def hall_params
    params.require(:hall).permit(:name, :capacity)
  end
end
