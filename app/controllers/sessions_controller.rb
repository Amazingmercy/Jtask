class SessionsController < ApplicationController
    def new
      render :login
    end
  
    def create
      # Retrieve the user based on the provided username/email
      user = User.find_by(email: params[:email])
  
      if user && user.authenticate(params[:password])
        # Set the user ID in the session to indicate successful login
        session[:user_id] = user.id
        redirect_to tasks_path, notice: 'Logged in successfully!'
      else
        redirect_to login_path, notice: 'Invalid email or password'
      end
    end
  
    def destroy
      # Clear the session and log out the user
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully!'
    end
end
  
  