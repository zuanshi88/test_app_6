class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    # this line makes the helper method available to both controllers and views
     def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end 
     
    def logged_in?
        !!current_user
    end 

end
