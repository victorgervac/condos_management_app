class AddMissingAttributesToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :average_review_rating, :decimal, precision: 5, scale: 2
    add_column :listings, :room_type, :string
    add_column :listings, :bathroom_type, :string
    add_column :listings, :bedrooms_number, :integer
    add_column :listings, :beds_number, :integer
    add_column :listings, :bed_type, :string
    add_column :listings, :bathrooms_number, :integer
    add_column :listings, :min_nights, :integer
    add_column :listings, :max_nights, :integer
    add_column :listings, :guests_included, :integer
    add_column :listings, :price_for_extra_person, :decimal, precision: 8, scale: 2
    add_column :listings, :instant_bookable, :boolean
    add_column :listings, :instant_bookable_lead_time, :integer
    add_column :listings, :allow_same_day_booking, :boolean
    add_column :listings, :same_day_booking_lead_time, :integer
    add_column :listings, :wifi_username, :string
    add_column :listings, :wifi_password, :string
    add_column :listings, :is_rental_agreement_active, :boolean, default: false
    add_column :listings, :listing_agreement_text, :text
    add_column :listings, :insurance_eligibility_status, :boolean, default: false
    add_column :listings, :airbnb_listing_url, :string
    add_column :listings, :vrbo_listing_url, :string
    add_column :listings, :google_vr_listing_url, :string
  end
end
