# frozen_string_literal: true

class CreateNotifications < ActiveRecord::Migration[7.0]
  def change
    create_table :notifications do |t|
      t.string :notification_type, default: 'system'
      t.text :message
      t.string :url
      t.references :profile, null: false, foreign_key: true
      t.boolean :readed, Default: false

      t.timestamps
    end
  end
end
