class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false

      t.string 'street_line_one'
      t.string 'street_line_two'
      t.string 'city'
      t.string 'state'
      t.string 'postal_code'
      t.string 'country'
      t.string 'county'
      t.float 'longitude'
      t.float 'latitude'

      t.integer 'type'

      t.timestamps
    end
  end
end
