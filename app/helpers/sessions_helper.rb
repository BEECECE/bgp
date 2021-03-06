module SessionsHelper
    def current_user
      session[:user_id].nil? ? false : User.find(session[:user_id]) 
    end
  
    def log_in(user)
      session[:user_id] = user.id
    end
  
    def logged_in?
      session[:user_id].nil? ? false : true
    end
  end
  