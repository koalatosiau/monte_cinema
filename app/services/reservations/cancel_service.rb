class Reservations::CancelService
  def initialize(reservation)
    @reservation = reservation
  end

  def call
    Reservation.transaction do
      @reservation.cancelled!
      @reservation.seats.destroy_all
    end
  end
end
