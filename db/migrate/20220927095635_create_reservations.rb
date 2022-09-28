class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :quantity, null: false
      t.check_constraint("quantity >= 1", name: "quantity_check")
      t.integer :status, null: false, default: 0
      t.references :screening, index: true

      t.timestamps
    end
  end
end
