class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update]
  before_action :set_screening, only: %i[new create edit]

  def index
    @reservations = Reservation.includes(screening: :movie)
  end

  def new
    @reservation = @screening.reservations.build
  end

  def create
    if @screening.reservations.create!(reservation_params)
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
      redirect_to screening_reservation_path(@reservation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_reservation
    @reservation = Reservation.includes(:screening).find(params[:id])
  end

  def set_screening
    @screening = Screening.find(params[:screening_id])
  end

  def reservation_params
    params.require(:reservation).permit(:quantity, :status, :email)
  end
end
