class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?

  def current_user 
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def sign_in(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user 
  end

  def sign_out
    current_user.reset_session_token!
    @current_user = nil 
    session[:session_token] = nil
  end

  def signed_in?
    !!current_user
  end

  def require_signed_in
    render json: ['You must be signed in to complete that action.'] unless signed_in?
  end

end
