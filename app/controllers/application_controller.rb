class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # Methods made here are available to all other controllers
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def current_user #refer back to this for portfolio project
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id] #look up || =
  end
  
  def logged_in?
    !!current_user #creates a current user boolean (T or F)
    end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to preform that action"
      redirect_to :back
      end
  end

end
