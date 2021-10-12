class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? #makes these available in views

  def login(user)
    session[:session_token] = user.reset_session_token!
    #reset user session token and define session's session token as the same
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
    #if not already defined as instance variable, find by session token
  end

  def logged_in?
    !!current_user # nil ? false : true
  end

  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
    #if not logged in, render new session form 
  end

  def require_logged_out
    redirect_to users_url if logged_in?
    #go to users index if not logged out
  end

end
