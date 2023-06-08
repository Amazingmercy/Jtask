class AddCompletedTasksCountToUsers < ActiveRecord::Migration[7.0]
    def change
      add_column :users, :completed_tasks_count, :integer
    end
end
  