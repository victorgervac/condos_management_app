class AddFieldsToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :guest_first_name, :string
    add_column :reservations, :guest_last_name, :string
    add_column :reservations, :guest_zip_code, :string
    add_column :reservations, :guest_address, :string
    add_column :reservations, :guest_city, :string
    add_column :reservations, :guest_country, :string

    add_column :reservations, :guest_picture, :string
    add_column :reservations, :guest_recommendations, :string
    add_column :reservations, :guest_trips, :string
    add_column :reservations, :guest_work, :string
    add_column :reservations, :listing_name, :string
    add_column :reservations, :arrival_date, :string
    add_column :reservations, :departure_date, :string
  end
end
