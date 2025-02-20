class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.integer :hostaway_id
      t.references :reservation, null: false, foreign_key: true
      t.string :sender
      t.string :receiver
      t.text :content
      t.datetime :sent_at

      t.timestamps
    end
  end
end
