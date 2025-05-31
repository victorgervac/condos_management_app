class CreateCharges < ActiveRecord::Migration[7.0]
  def change
    create_table :charges do |t|
      t.references :expense, null: false, foreign_key: true
      t.string :description
      t.decimal :amount

      t.timestamps
    end
  end
end
