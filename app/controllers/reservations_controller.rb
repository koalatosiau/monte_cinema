class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[show edit update]
  before_action :set_screening, only: %i[new create show edit]

  def index
    authorize Reservation
    @reservations = policy_scope(Reservation).includes(screening: :movie)
  end

  def new
    @reservation = @screening.reservations.build
  end

  def create
    new_reservation_params = reservation_params.merge(email: current_user&.email) if current_user&.user?
    if @screening.reservations.create!(new_reservation_params || reservation_params)
      redirect_to after_create_reservation_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @reservation.update(reservation_params)
      redirect_to screening_reservation_path(@reservation)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def after_create_reservation_path
    user_signed_in? ? reservations_path : root_path
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
  end

  def set_screening
    @screening = Screening.find(params[:screening_id])
  end

  def reservation_params
    params.require(:reservation).permit(:quantity, :status, :email)
  end
end
