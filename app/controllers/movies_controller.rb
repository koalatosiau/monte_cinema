class MoviesController < ApplicationController
  before_action :set_movie, only: %i[show edit update destroy]

  def index
    @movies = Movie.all
    authorize @movies
  end

  def new
    authorize Movie
    @movie = Movie.new
  end

  def create
    authorize Movie
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: t('movie.created')
    else
      flash.now[:alert] = @movie.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: t('movie.updated')
    else
      flash.now[:alert] = @movie.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy

    redirect_to movies_path, status: :see_other, alert: t('movie.deleted')
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
    authorize @movie
  end

  def movie_params
    params.require(:movie).permit(:title, :description, :runtime)
  end
end
