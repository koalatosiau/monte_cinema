class CreateSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :seats do |t|
      t.integer :number, null: false
      t.references :reservation, index: true

      t.timestamps
    end
  end
end
