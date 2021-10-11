class SessionsController < ApplicationController
  before_action :require_logged_in, only:[:destroy]
  before_action :require_logged_out, only:[:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if @user
      login(@user)
      redirect_to cats_url
    else
      render json: ["Invalid username or password"]
    end
  end

  def destroy
    user = current_user
    if user
      logout
    end
    redirect_to cats_url
  end

end
