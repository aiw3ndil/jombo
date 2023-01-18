class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :type
      t.string :brand
      t.string :model
      t.string :color
      t.string :seats_available
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
