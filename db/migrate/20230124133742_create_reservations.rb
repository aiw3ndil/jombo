class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
