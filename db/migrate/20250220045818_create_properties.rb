class CreateProperties < ActiveRecord::Migration[7.0]
  def change
    create_table :properties do |t|
      t.integer :hostaway_id
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.float :latitude
      t.float :longitude
      t.decimal :price_per_night
      t.integer :bedrooms
      t.integer :bathrooms
      t.text :amenities

      t.timestamps
    end
  end
end
