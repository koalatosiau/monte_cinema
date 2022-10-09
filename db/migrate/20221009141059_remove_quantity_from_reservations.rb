class RemoveQuantityFromReservations < ActiveRecord::Migration[7.0]
  def change
    safety_assured { remove_column :reservations, :quantity, :integer }
  end
end
