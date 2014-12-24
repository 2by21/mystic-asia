class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :admin?

   protected 

    def admin?
      session[:username] == ENV['USERNAME'] && session[:password] == ENV['PASSWORD']
    end

    def authorize
      unless admin?
        flash[:error] = "Unauthorized access."
        redirect_to "/"
        false
      end
    end

end
