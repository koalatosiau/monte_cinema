class Reservations::CancelJob < ApplicationJob
  queue_as :default

  def perform(reservation)
    return unless reservation.pending?

    Reservations::CancelService.new(reservation).call
  end
end
