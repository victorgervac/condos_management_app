class AddFieldsToListings < ActiveRecord::Migration[7.0]
  def change
    add_column :listings, :hostaway_id, :integer
  end
end
