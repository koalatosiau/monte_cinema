class AddEmailToReservations < ActiveRecord::Migration[7.0]
  class Reservation < ActiveRecord::Base

    def change
      add_column :reservations, :email, :string, null: false
      end
    end
end
