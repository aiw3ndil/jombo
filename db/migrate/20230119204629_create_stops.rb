# frozen_string_literal: true

class CreateStops < ActiveRecord::Migration[7.0]
  def change
    create_table :stops do |t|
      t.integer :duration
      t.st_point :place
      t.string :description
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
