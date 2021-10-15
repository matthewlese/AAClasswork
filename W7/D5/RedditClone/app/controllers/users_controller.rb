class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    # @user = User.find_by(username: params[:username]) # may want to use find(:id)
    @user = User.find(params[:id])
    render :show
  end

  def index
    @users = User.all
    render :index
  end

  def edit
    @user = User.find(params[:id])
    render :edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
