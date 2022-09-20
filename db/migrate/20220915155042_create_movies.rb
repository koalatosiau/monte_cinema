class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.name :title, null: false
      t.text :description
      t.integer :runtime, null: false,
      t.check_constraint("runtime > 0", name: "runtime_check")

      t.timestamps
    end
  end
end
