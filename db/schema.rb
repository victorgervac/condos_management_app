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

ActiveRecord::Schema[7.0].define(version: 2025_02_27_060717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hosts", force: :cascade do |t|
    t.integer "hostaway_id"
    t.string "name"
    t.string "email"
    t.string "phone"
    t.decimal "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "listings", force: :cascade do |t|
    t.boolean "availability"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "external_listing_name"
    t.string "internal_listing_name"
    t.text "description"
    t.string "thumbnail_url"
    t.text "house_rules"
    t.text "key_pickup"
    t.text "special_instruction"
    t.integer "door_security_code"
    t.string "country"
    t.integer "country_code"
    t.string "state"
    t.string "city"
    t.string "street"
    t.string "address"
    t.string "public_address"
    t.string "zipcode"
    t.decimal "price"
    t.integer "star_rating"
    t.decimal "weekly_discount"
    t.decimal "monthly_discount"
    t.decimal "property_rent_tax"
    t.decimal "guest_per_person_per_night_tax"
    t.decimal "guest_stay_tax"
    t.decimal "guest_nightly_tax"
    t.decimal "refundable_damage_deposit"
    t.decimal "is_deposit_stay_collected"
    t.integer "person_capacity"
    t.integer "max_children_allowed"
    t.integer "max_infants_allowed"
    t.integer "max_pets_allowed"
    t.decimal "lat"
    t.decimal "lng"
    t.integer "check_in_time_start"
    t.integer "check_in_time_end"
    t.integer "check_out_time"
    t.integer "cancellation_policy"
    t.integer "cleaning_fee"
    t.integer "checkin_fee"
    t.string "contact_name"
    t.string "contact_sur_name"
    t.string "contact_phone1"
    t.string "contact_phone2"
    t.string "contact_language"
    t.string "contact_email"
    t.string "contact_address"
    t.string "language"
  end

  create_table "messages", force: :cascade do |t|
    t.integer "hostaway_id"
    t.bigint "reservation_id", null: false
    t.string "sender"
    t.string "receiver"
    t.text "content"
    t.datetime "sent_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reservation_id"], name: "index_messages_on_reservation_id"
  end

  create_table "properties", force: :cascade do |t|
    t.integer "hostaway_id"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.float "latitude"
    t.float "longitude"
    t.decimal "price_per_night"
    t.integer "bedrooms"
    t.integer "bathrooms"
    t.text "amenities"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "hostaway_id"
    t.bigint "property_id", null: false
    t.string "guest_name"
    t.string "guest_email"
    t.date "check_in"
    t.date "check_out"
    t.decimal "total_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_reservations_on_property_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "preferred_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.integer "failed_attempts", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "reservations"
  add_foreign_key "reservations", "properties"
end
