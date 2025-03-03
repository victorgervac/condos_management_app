class AddHostawayIdToCleaningTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :cleaning_tasks, :hostaway_id, :integer
  end
end
