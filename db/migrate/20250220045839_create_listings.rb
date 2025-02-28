class CreateListings < ActiveRecord::Migration[7.0]
  def change
    create_table :listings do |t|
      t.integer :hostaway_id
      t.string :platform
      t.string :status
      t.decimal :price
      t.boolean :availability

      t.timestamps
    end
  end
end
