class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update]
  before_action :set_screenings, only: %i[new edit]

  def index
    @reservations = Reservation.includes(screening: :movie)
  end

  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)

    if @reservation.save
      redirect_to reservations_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @screening = @reservation.screening
  end

  def edit; end

  def update
    if @reservation.update(reservation_params)
      redirect_to @reservation
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.includes(:screening).find(params[:id])
  end

  def set_screenings
    @screenings = Screening.includes(:movie).order(:start)
  end

  def reservation_params
    params.require(:reservation).permit(:quantity, :status, :screening_id)
  end
end
