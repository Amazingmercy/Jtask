class TasksController < ApplicationController
    before_action :require_login

    def index
      @task = current_user.tasks
      @percentage = (current_user.tasks.where(completed: true). count/current_user.tasks.count.to_f)*100
      @f_percentage = sprintf("%.1f", @percentage)
      if @f_percentage == '100.0'
        flash[:notice] = 'Welldone! All tasks completed!'
      elsif @f_percentage >= '70.0' && @f_percentage <= '99.0'
        flash[:notice] = "You're almost there!"
      elsif @f_percentage >= '50.0' && @f_percentage <= '69.0'
        flash[:notice] = "Keep going, you can do it!"
      else
        flash[:notice] = "Wonderful start!"
      end 
    end
      
    def new
      @task = current_user.tasks.new
      render :create
    end
  
    def create
      @task = current_user.tasks.new(task_params)
    
      if @task.save
        redirect_to task_path(@task), notice: 'Task created successfully!'
      else
        render :index
      end
    end
  
    def show
        @task = current_user.tasks.find(params[:id])
    end
  
  
    def edit
        @task = current_user.tasks.find_by(id: params[:id])
    end
  
  
    def update
      @task = current_user.tasks.find(params[:id])
      if @task.update(task_params)
        flash[:notice] = 'Task updated successfully!'
        redirect_to tasks_path(@task)
      else
        render :edit
      end
    end
  
    def completed?
      completed
    end
  
  
    def destroy
      @task = current_user.tasks.find_by(id: params[:id])
      @task.destroy
      flash[:notice] = 'Task deleted successfully!'
      redirect_to tasks_path(@task)
    end
  
    #Yet to be implemented
    #def update_daily_achievement
    # if completed_changed? && completed?
    #    today = Time.zone.today
    #    daily_tasks = Task.where(user_id: user_id, created_at: today.beginning_of_day..today.end_of_day)
    #    completed_tasks = daily_tasks.where(completed: true)
    #    self.daily_count = completed_tasks.count
    #    self.percentage = (daily_count.to_f / daily_tasks.count * 100).round(2)
    #    save
    # end
    #end
    
  
private
  
    def task_params
      params.require(:task).permit(:title, :body, :completed)
    end
  
    
end
  
  