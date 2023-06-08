class AddDailyCountAndPercentageToTasks < ActiveRecord::Migration[7.0]
    def change
      add_column :tasks, :daily_count, :integer, default: 0
      add_column :tasks, :percentage, :float, default: 0.0
    end
end
  