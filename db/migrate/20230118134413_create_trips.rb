# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.string :source
      t.string :destination
      t.integer :seats_available, default: 0
      t.text :comments
      t.string :status, default: 'open'
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
