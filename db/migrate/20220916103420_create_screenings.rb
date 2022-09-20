class CreateScreenings < ActiveRecord::Migration[7.0]
  def change
    create_table :screenings do |t|
      t.datetime :start, null: false
      t.references :hall, :movie, index: true

      t.timestamps
    end
  end
end
