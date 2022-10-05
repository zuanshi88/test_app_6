class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?
    # this line makes the helper method available to both controllers and views

    #QUESTION -- what is the difference between defining methods in ApplicationController
    # and defining them in app/helpers/application_helper ???

     def current_user 
        # @current_user = User.find(9)
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
     end 
     
    def logged_in?
        !!current_user
    end 

    def require_user 
        if !logged_in?
            flash[:alert] = "You must be logged in to perform that action"
            redirect_to login_path 
        end     
    end 




end
