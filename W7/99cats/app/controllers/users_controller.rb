class UsersController < ApplicationController
  

  def new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to cats_url
    else
      render json: @users.errors.full_messages, status: 422
    end
  end

  def user_params
    params.require(:user).permit(:user_name)
  end

end
