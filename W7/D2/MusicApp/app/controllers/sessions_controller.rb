class SessionsController < ApplicationController
  before_action :require_logged_out, only[:new, :create]
  before_action :require_logged_in, only[:destroy]

  def new
    render :new
  end

  def create
    #look up user by email and password
    @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if @user
      login(@user)
      redirect_to users_url #send to index page
    else #finding user unsuccessful
      flash.now[:errors] = ["Invalid email or password"]
      render :new #render new form on error
    end
  end

  def destroy
    logout
    #reset session token for user, nilify session's session token, nilify current_user
    flash[:messages] = ["Successfully logged out"]
    redirect_to new_session_url #load new session form
  end

end
