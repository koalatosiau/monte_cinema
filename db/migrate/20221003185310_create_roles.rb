class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.integer :access_level, null: false, default: 0

      t.timestamps
    end
  end
end
