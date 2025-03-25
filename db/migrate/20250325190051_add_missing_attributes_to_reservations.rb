class AddMissingAttributesToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :channel_id, :integer
    add_column :reservations, :source, :string
    add_column :reservations, :channel_name, :string
    add_column :reservations, :reservation_id, :string
    add_column :reservations, :hostaway_reservation_id, :integer
    add_column :reservations, :channel_reservation_id, :string
    add_column :reservations, :external_property_id, :string
    add_column :reservations, :external_rate_plan_id, :string
    add_column :reservations, :external_unit_id, :string
    add_column :reservations, :assignee_user_id, :integer
    add_column :reservations, :manual_ical_id, :string
    add_column :reservations, :manual_ical_name, :string
    add_column :reservations, :is_processed, :boolean, default: false
    add_column :reservations, :is_initial, :boolean, default: false
    add_column :reservations, :is_manually_checked, :boolean, default: false
    add_column :reservations, :is_instant_booked, :boolean, default: false
    add_column :reservations, :has_pull_error, :boolean, default: false
    add_column :reservations, :reservation_date, :datetime
    add_column :reservations, :pending_expire_date, :datetime
    add_column :reservations, :guest_external_account_id, :string

    add_column :reservations, :is_guest_identity_verified, :boolean, default: false
    add_column :reservations, :is_guest_verified_by_email, :boolean, default: false
    add_column :reservations, :is_guest_verified_by_work_email, :boolean, default: false
    add_column :reservations, :is_guest_verified_by_facebook, :boolean, default: false
    add_column :reservations, :is_guest_verified_by_government_id, :boolean, default: false
    add_column :reservations, :is_guest_verified_by_phone, :boolean, default: false
    add_column :reservations, :is_guest_verified_by_reviews, :boolean, default: false
    add_column :reservations, :number_of_guests, :integer
    add_column :reservations, :adults, :integer
    add_column :reservations, :children, :integer
    add_column :reservations, :infants, :integer
    add_column :reservations, :pets, :integer

    add_column :reservations, :is_dates_unspecified, :boolean, default: false
    add_column :reservations, :previous_arrival_date, :date
    add_column :reservations, :previous_departure_date, :date
    add_column :reservations, :check_in_time, :string
    add_column :reservations, :check_out_time, :string
    add_column :reservations, :nights, :integer
    add_column :reservations, :phone, :string

    add_column :reservations, :tax_amount, :decimal, precision: 10, scale: 2
    add_column :reservations, :channel_commission_amount, :decimal, precision: 10, scale: 2
    add_column :reservations, :hostaway_commission_amount, :decimal, precision: 10, scale: 2
    add_column :reservations, :cleaning_fee, :decimal, precision: 10, scale: 2
    add_column :reservations, :security_deposit_fee, :decimal, precision: 10, scale: 2
    add_column :reservations, :is_paid, :boolean, default: false
    add_column :reservations, :payment_method, :string
    add_column :reservations, :stripe_guest_id, :string
    add_column :reservations, :currency, :string

    add_column :reservations, :cancellation_date, :datetime
    add_column :reservations, :cancelled_by, :string
    add_column :reservations, :host_note, :text
    add_column :reservations, :guest_note, :text
    add_column :reservations, :guest_locale, :string
    add_column :reservations, :door_code, :string
    add_column :reservations, :door_code_vendor, :string
    add_column :reservations, :door_code_instruction, :string
    add_column :reservations, :comment, :text
    add_column :reservations, :confirmation_code, :string
    add_column :reservations, :airbnb_expected_payout_amount, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_listing_base_price, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_listing_cancellation_host_fee, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_listing_cancellation_payout, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_listing_cleaning_fee, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_listing_host_fee, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_listing_security_price, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_occupancy_tax_amount_paid_to_host, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_total_paid_amount, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_transient_occupancy_tax_paid_amount, :decimal, precision: 10, scale: 2
    add_column :reservations, :airbnb_cancellation_policy, :string
    add_column :reservations, :is_starred, :boolean, default: false
    add_column :reservations, :is_archived, :boolean, default: false
    add_column :reservations, :is_pinned, :boolean, default: false
    add_column :reservations, :original_channel, :string
    add_column :reservations, :customer_user_id, :integer
    add_column :reservations, :rental_agreement_file_url, :string
    add_column :reservations, :reservation_agreement, :string
    add_column :reservations, :remaining_balance, :decimal, precision: 10, scale: 2
    add_column :reservations, :insurance_status, :string
    add_column :reservations, :claim_status, :string
    add_column :reservations, :insurance_policy_id, :integer
    add_column :reservations, :cancellation_policy_id, :integer
    add_column :reservations, :host_proxy_email, :string
  end
end
