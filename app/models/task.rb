class Task < ApplicationRecord
    validates :title, presence: true

    belongs_to :user
    #self.primary_key = 'task_id'

    #after_save :update_completed_tasks_count
    #after_destroy :update_completed_tasks_count
    after_save :update_daily_achievement


    #def update_completed_tasks_count
        # Logic to update the completed tasks count
        #completed_tasks_count = Task.where(completed: true).count
    #end
      
    def update_daily_achievement
        if completed_changed? && completed?
          today = Time.zone.today
          daily_tasks = user.tasks.where(created_at: today.beginning_of_day..today.end_of_day)
          completed_tasks = daily_tasks.where(completed: true)
          self.daily_count = completed_tasks.count
          self.percentage =((daily_count.to_f / daily_tasks.count) * 100).round(2)
          save
        end
    end

end
