class AddOwnerIdToListings < ActiveRecord::Migration[7.0]
  def change
    add_reference :listings, :owner, null: true, foreign_key: { to_table: :users }
  end
end
