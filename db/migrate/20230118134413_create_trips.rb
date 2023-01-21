# frozen_string_literal: true

class CreateTrips < ActiveRecord::Migration[7.0]
  def change
    create_table :trips do |t|
      t.datetime :start_date
      t.st_point :source
      t.st_point :destination
      t.monetize :price
      t.text :comments
      t.references :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
