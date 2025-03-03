class CreateCleaningTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :cleaning_tasks do |t|
      t.datetime :cleaning_date
      t.belongs_to :reservation, null: false, foreign_key: true
      t.belongs_to :listing, null: false, foreign_key: true
      t.decimal :total

      t.timestamps
    end
  end
end
