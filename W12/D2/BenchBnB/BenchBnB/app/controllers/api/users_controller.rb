class Api::UsersController < ApplicationController
  def create 
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      render :show
    else
      render json: @user.error.full_messages, status: 401
    end
  end

  def user_params 
    params.require(:user).permit(:username, :password)
  end
end