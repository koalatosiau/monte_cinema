class HallsController < ApplicationController
  before_action :set_hall, only: %i[show edit update destroy]

  def index
    @halls = Hall.all
    authorize @halls
  end

  def new
    authorize Hall
    @hall = Hall.new
  end

  def create
    authorize Hall
    @hall = Hall.new(hall_params)

    if @hall.save
      redirect_to halls_path, notice: t('hall.created')
    else
      flash.now[:alert] = @hall.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @hall.update(hall_params)
      redirect_to @hall, notice: t('hall.updated')
    else
      flash.now[:alert] = @hall.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @hall.destroy

    redirect_to halls_path, status: :see_other, alert: t('hall.deleted')
  end

  private

  def set_hall
    @hall = Hall.find(params[:id])
    authorize @hall
  end

  def hall_params
    params.require(:hall).permit(:name, :capacity)
  end
end
