class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.string :receipt
      t.decimal :total
      t.date :purchase_on
      t.string :payment_type
      t.string :purchase_place
      t.boolean :paid
      t.string :category
      t.text :notes

      t.timestamps
    end
  end
end
