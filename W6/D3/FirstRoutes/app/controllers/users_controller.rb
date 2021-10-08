class UsersController < ApplicationController

  def index
    render json: User.all
  end

  def create
    p params
    user = User.new(params.require(:user).permit(:name, :email))
    # replace the `user_attributes_here` with the actual attribute keys
    user.save!
    render json: user
  end

  def show
    render json: params
  end

end