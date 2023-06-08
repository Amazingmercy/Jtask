# app/controllers/users_controller.rb
class UserController < ApplicationController
  
    def new
      @user = User.new
      render :signup
    end
  
    def create
      @user = User.new(user_params)
  
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = 'Sign up successful! Welcome.'
        redirect_to root_path 
      else
        render :new
      end
    end
  
    def completed_tasks_count
      tasks.where(completed: true).count
    end
  
  private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :completed_tasks_count)
    end
end
  