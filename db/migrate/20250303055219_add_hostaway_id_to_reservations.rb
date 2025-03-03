class AddHostawayIdToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :listing_map_id, :integer
  end
end
