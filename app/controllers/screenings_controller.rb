class ScreeningsController < ApplicationController
  before_action :set_screening, only: %i[show]
  before_action :set_hall, :set_movie, only: %i[new create]

  def index
    @screenings = Screening.all
  end

  def new
    @screening = Screening.new
  end

  def create
    @screening = Screening.new(screening_params)

    if @screening.save
      redirect_to screenings_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def set_screening
    @screening = Screening.find(params[:id])
  end

  def set_hall
    @halls = Hall.all.order(:name)
  end

  def set_movie
    @movies = Movie.all.order(:title)
  end

  def screening_params
    params.require(:screening).permit(:start, :hall_id, :movie_id)
  end
end
