class AddListingMapToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :listing_map_id, :integer
  end
end
