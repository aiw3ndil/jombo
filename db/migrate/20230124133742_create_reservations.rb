# frozen_string_literal: true

class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :profile, null: false, foreign_key: { to_table: :profiles }
      t.references :trip, null: false, foreign_key: true
      t.references :profile_request, null: false, foreign_key: { to_table: :profiles }
      t.string :status

      t.timestamps
    end
  end
end
