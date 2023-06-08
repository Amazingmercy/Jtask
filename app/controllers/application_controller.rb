class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    #before_action :require_login
    protect_from_forgery with: :exception
    private
  
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
  
    def logged_in?
      !current_user.nil?
    end
  
    def require_login
      unless logged_in?
        redirect_to login_path, alert: 'Please log in.'
      end
    end
end
  

