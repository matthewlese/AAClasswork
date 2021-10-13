class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      redirect_to user_url(@user) #show page
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
