class AddEmailToReservations < ActiveRecord::Migration[7.0]
  class Reservation < ActiveRecord::Base
    end

    def change
      add_column :reservations, :email, :string
      Reservation.reset_column_information
      Reservation.all.each do |reservation|
        reservation.update(:email => 'example@example.com'  )
      end
    end
end
