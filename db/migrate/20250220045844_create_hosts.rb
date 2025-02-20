class CreateHosts < ActiveRecord::Migration[7.0]
  def change
    create_table :hosts do |t|
      t.integer :hostaway_id
      t.string :name
      t.string :email
      t.string :phone
      t.decimal :rating

      t.timestamps
    end
  end
end
