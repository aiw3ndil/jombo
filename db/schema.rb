# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_124_212_218) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'active_storage_attachments', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'record_type', null: false
    t.bigint 'record_id', null: false
    t.bigint 'blob_id', null: false
    t.datetime 'created_at', null: false
    t.index ['blob_id'], name: 'index_active_storage_attachments_on_blob_id'
    t.index %w[record_type record_id name blob_id], name: 'index_active_storage_attachments_uniqueness',
                                                    unique: true
  end

  create_table 'active_storage_blobs', force: :cascade do |t|
    t.string 'key', null: false
    t.string 'filename', null: false
    t.string 'content_type'
    t.text 'metadata'
    t.string 'service_name', null: false
    t.bigint 'byte_size', null: false
    t.string 'checksum'
    t.datetime 'created_at', null: false
    t.index ['key'], name: 'index_active_storage_blobs_on_key', unique: true
  end

  create_table 'active_storage_variant_records', force: :cascade do |t|
    t.bigint 'blob_id', null: false
    t.string 'variation_digest', null: false
    t.index %w[blob_id variation_digest], name: 'index_active_storage_variant_records_uniqueness', unique: true
  end

  create_table 'notifications', force: :cascade do |t|
    t.string 'notification_type', default: 'system'
    t.text 'message'
    t.string 'url'
    t.bigint 'profile_id', null: false
    t.boolean 'readed'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['profile_id'], name: 'index_notifications_on_profile_id'
  end

  create_table 'profiles', force: :cascade do |t|
    t.string 'username'
    t.string 'first_name'
    t.string 'last_name'
    t.string 'street'
    t.string 'city'
    t.string 'region'
    t.string 'postal_code'
    t.string 'country'
    t.boolean 'verified'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_profiles_on_user_id'
  end

  create_table 'reservations', force: :cascade do |t|
    t.bigint 'profile_id', null: false
    t.bigint 'trip_id', null: false
    t.bigint 'profile_request_id', null: false
    t.string 'status'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['profile_id'], name: 'index_reservations_on_profile_id'
    t.index ['profile_request_id'], name: 'index_reservations_on_profile_request_id'
    t.index ['trip_id'], name: 'index_reservations_on_trip_id'
  end

  create_table 'stops', force: :cascade do |t|
    t.integer 'duration'
    t.string 'place'
    t.string 'description'
    t.bigint 'trip_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['trip_id'], name: 'index_stops_on_trip_id'
  end

  create_table 'trips', force: :cascade do |t|
    t.datetime 'start_date'
    t.string 'source'
    t.string 'destination'
    t.integer 'seats_available', default: 0
    t.text 'comments'
    t.string 'status', default: 'open'
    t.bigint 'profile_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['profile_id'], name: 'index_trips_on_profile_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.integer 'failed_attempts', default: 0, null: false
    t.string 'unlock_token'
    t.datetime 'locked_at'
    t.string 'provider'
    t.string 'uid'
    t.boolean 'receive_newsletter', default: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['unlock_token'], name: 'index_users_on_unlock_token', unique: true
  end

  create_table 'vehicles', force: :cascade do |t|
    t.string 'vehicle_type'
    t.string 'brand'
    t.string 'model'
    t.string 'color'
    t.bigint 'profile_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['profile_id'], name: 'index_vehicles_on_profile_id'
  end

  add_foreign_key 'active_storage_attachments', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'active_storage_variant_records', 'active_storage_blobs', column: 'blob_id'
  add_foreign_key 'notifications', 'profiles'
  add_foreign_key 'profiles', 'users'
  add_foreign_key 'reservations', 'profiles'
  add_foreign_key 'reservations', 'profiles', column: 'profile_request_id'
  add_foreign_key 'reservations', 'trips'
  add_foreign_key 'stops', 'trips'
  add_foreign_key 'trips', 'profiles'
  add_foreign_key 'vehicles', 'profiles'
end