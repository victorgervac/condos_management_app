class RemoveFieldsFromListing < ActiveRecord::Migration[7.0]
  def change
    remove_column :listings, :hostaway_id, :integer
    remove_column :listings, :property_id, :integer
    remove_column :listings, :platform, :string
    remove_column :listings, :status, :string
    remove_column :listings, :price, :decimal
  end
end
