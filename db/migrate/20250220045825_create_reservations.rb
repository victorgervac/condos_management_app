class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :hostaway_id
      t.references :property, null: false, foreign_key: true
      t.string :guest_name
      t.string :guest_email
      t.date :check_in
      t.date :check_out
      t.decimal :total_price
      t.string :status

      t.timestamps
    end
  end
end
