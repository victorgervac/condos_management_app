class AddListingsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_reference :reservations, :listing, null: true, foreign_key: true
  end
end
