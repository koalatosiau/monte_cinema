class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[confirm cancel]
  before_action :set_screening, only: %i[new create confirm cancel]
  before_action :load_form, only: %i[new create]

  def index
    authorize Reservation
    @reservations = policy_scope(Reservation).includes(screening: :movie)
  end

  def new; end

  def create
    redirect_existing_user and return if login_required?

    if @form.submit(reservation_params)
      redirect_to after_create_reservation_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def confirm
    @reservation.confirmed!
    redirect_to screening_reservations_path(@screening, @reservation), status: :see_other
  end

  def cancel
    @reservation.cancelled!
    redirect_to screening_reservations_path(@screening, @reservation), status: :see_other
  end

  private

  def load_form
    @form = ReservationForm.new(@screening)
  end

  def login_required?
    return if current_user

    User.pluck(:email).include?(params[:reservation_form][:email])
  end

  def redirect_existing_user
    flash[:alert] = "Sign in before reservation"
    redirect_to new_user_session_path, status: :see_other
  end

  def after_create_reservation_path
    user_signed_in? ? reservations_path : root_path
  end

  def set_reservation
    @reservation = Reservation.find(params[:id])
    authorize @reservation
  end

  def set_screening
    @screening = Screening.find(params[:screening_id])
  end

  def reservation_params
    params.require(:reservation_form).permit(:email, numbers: []).merge(current_user: current_user)
  end
end
