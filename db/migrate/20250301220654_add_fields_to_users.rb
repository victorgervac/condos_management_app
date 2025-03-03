class AddFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :role, :integer
    add_column :users, :active, :boolean
    add_column :users, :access_start_date, :date
  end
end
