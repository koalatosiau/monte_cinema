class ScreeningsController < ApplicationController
  before_action :set_screening, only: %i[edit update destroy]
  before_action :set_halls, :set_movies, only: %i[new create edit update]

  def index
    @screenings = Screening.all
    authorize @screenings
  end

  def new
    authorize Screening
    @screening = Screening.new
  end

  def create
    authorize Screening
    @screening = Screening.new(screening_params)

    if @screening.save
      redirect_to screenings_path, notice: t('screening.created')
    else
      flash.now[:alert] = @screening.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @screening.update(screening_params)
      redirect_to screenings_path, notice: t('screening.updated')
    else
      flash.now[:alert] = @screening.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @screening.destroy

    redirect_to screenings_path, status: :see_other, notice: t('screening.deleted')
  end

  private

  def set_screening
    @screening = Screening.includes(:movie, :hall).find(params[:id])
    authorize @screening
  end

  def set_halls
    @halls = Hall.all.order(:name)
  end

  def set_movies
    @movies = Movie.all.order(:title)
  end

  def screening_params
    params.require(:screening).permit(:start, :hall_id, :movie_id)
  end
end
