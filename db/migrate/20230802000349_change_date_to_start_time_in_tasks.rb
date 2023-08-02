class ChangeDateToStartTimeInTasks < ActiveRecord::Migration[6.1]
  def change
     change_column :tasks, :date, :datetime
    rename_column :tasks, :date, :start_time
  end
end
