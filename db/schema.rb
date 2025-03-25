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

ActiveRecord::Schema[7.0].define(version: 2025_03_25_190051) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "addressable_type", null: false
    t.bigint "addressable_id", null: false
    t.string "street_line_one"
    t.string "street_line_two"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.string "country"
    t.string "county"
    t.float "longitude"
    t.float "latitude"
    t.integer "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable"
  end

  create_table "cleaning_tasks", force: :cascade do |t|
    t.datetime "cleaning_date"
    t.bigint "reservation_id", null: false
    t.bigint "listing_id", null: false
    t.decimal "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.integer "hostaway_id"
    t.index ["listing_id"], name: "index_cleaning_tasks_on_listing_id"
    t.index ["reservation_id"], name: "index_cleaning_tasks_on_reservation_id"
  end

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
    t.integer "hostaway_id"
    t.integer "listing_map_id"
    t.decimal "average_review_rating", precision: 5, scale: 2
    t.string "room_type"
    t.string "bathroom_type"
    t.integer "bedrooms_number"
    t.integer "beds_number"
    t.string "bed_type"
    t.integer "bathrooms_number"
    t.integer "min_nights"
    t.integer "max_nights"
    t.integer "guests_included"
    t.decimal "price_for_extra_person", precision: 8, scale: 2
    t.boolean "instant_bookable"
    t.integer "instant_bookable_lead_time"
    t.boolean "allow_same_day_booking"
    t.integer "same_day_booking_lead_time"
    t.string "wifi_username"
    t.string "wifi_password"
    t.boolean "is_rental_agreement_active", default: false
    t.text "listing_agreement_text"
    t.boolean "insurance_eligibility_status", default: false
    t.string "airbnb_listing_url"
    t.string "vrbo_listing_url"
    t.string "google_vr_listing_url"
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

  create_table "reservations", force: :cascade do |t|
    t.integer "hostaway_id"
    t.string "guest_name"
    t.string "guest_email"
    t.date "check_in"
    t.date "check_out"
    t.decimal "total_price"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "guest_first_name"
    t.string "guest_last_name"
    t.string "guest_zip_code"
    t.string "guest_address"
    t.string "guest_city"
    t.string "guest_country"
    t.string "guest_picture"
    t.string "guest_recommendations"
    t.string "guest_trips"
    t.string "guest_work"
    t.string "listing_name"
    t.string "arrival_date"
    t.string "departure_date"
    t.integer "listing_map_id"
    t.integer "channel_id"
    t.string "source"
    t.string "channel_name"
    t.string "reservation_id"
    t.integer "hostaway_reservation_id"
    t.string "channel_reservation_id"
    t.string "external_property_id"
    t.string "external_rate_plan_id"
    t.string "external_unit_id"
    t.integer "assignee_user_id"
    t.string "manual_ical_id"
    t.string "manual_ical_name"
    t.boolean "is_processed", default: false
    t.boolean "is_initial", default: false
    t.boolean "is_manually_checked", default: false
    t.boolean "is_instant_booked", default: false
    t.boolean "has_pull_error", default: false
    t.datetime "reservation_date"
    t.datetime "pending_expire_date"
    t.string "guest_external_account_id"
    t.boolean "is_guest_identity_verified", default: false
    t.boolean "is_guest_verified_by_email", default: false
    t.boolean "is_guest_verified_by_work_email", default: false
    t.boolean "is_guest_verified_by_facebook", default: false
    t.boolean "is_guest_verified_by_government_id", default: false
    t.boolean "is_guest_verified_by_phone", default: false
    t.boolean "is_guest_verified_by_reviews", default: false
    t.integer "number_of_guests"
    t.integer "adults"
    t.integer "children"
    t.integer "infants"
    t.integer "pets"
    t.boolean "is_dates_unspecified", default: false
    t.date "previous_arrival_date"
    t.date "previous_departure_date"
    t.string "check_in_time"
    t.string "check_out_time"
    t.integer "nights"
    t.string "phone"
    t.decimal "tax_amount", precision: 10, scale: 2
    t.decimal "channel_commission_amount", precision: 10, scale: 2
    t.decimal "hostaway_commission_amount", precision: 10, scale: 2
    t.decimal "cleaning_fee", precision: 10, scale: 2
    t.decimal "security_deposit_fee", precision: 10, scale: 2
    t.boolean "is_paid", default: false
    t.string "payment_method"
    t.string "stripe_guest_id"
    t.string "currency"
    t.datetime "cancellation_date"
    t.string "cancelled_by"
    t.text "host_note"
    t.text "guest_note"
    t.string "guest_locale"
    t.string "door_code"
    t.string "door_code_vendor"
    t.string "door_code_instruction"
    t.text "comment"
    t.string "confirmation_code"
    t.decimal "airbnb_expected_payout_amount", precision: 10, scale: 2
    t.decimal "airbnb_listing_base_price", precision: 10, scale: 2
    t.decimal "airbnb_listing_cancellation_host_fee", precision: 10, scale: 2
    t.decimal "airbnb_listing_cancellation_payout", precision: 10, scale: 2
    t.decimal "airbnb_listing_cleaning_fee", precision: 10, scale: 2
    t.decimal "airbnb_listing_host_fee", precision: 10, scale: 2
    t.decimal "airbnb_listing_security_price", precision: 10, scale: 2
    t.decimal "airbnb_occupancy_tax_amount_paid_to_host", precision: 10, scale: 2
    t.decimal "airbnb_total_paid_amount", precision: 10, scale: 2
    t.decimal "airbnb_transient_occupancy_tax_paid_amount", precision: 10, scale: 2
    t.string "airbnb_cancellation_policy"
    t.boolean "is_starred", default: false
    t.boolean "is_archived", default: false
    t.boolean "is_pinned", default: false
    t.string "original_channel"
    t.integer "customer_user_id"
    t.string "rental_agreement_file_url"
    t.string "reservation_agreement"
    t.decimal "remaining_balance", precision: 10, scale: 2
    t.string "insurance_status"
    t.string "claim_status"
    t.integer "insurance_policy_id"
    t.integer "cancellation_policy_id"
    t.string "host_proxy_email"
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
    t.integer "role"
    t.boolean "active"
    t.date "access_start_date"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "cleaning_tasks", "listings"
  add_foreign_key "cleaning_tasks", "reservations"
  add_foreign_key "messages", "reservations"
end
