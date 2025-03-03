class AddFieldsToCleaningTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :cleaning_tasks, :status, :integer
  end
end
