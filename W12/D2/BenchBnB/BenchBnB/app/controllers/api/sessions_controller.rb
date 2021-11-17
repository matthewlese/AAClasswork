class Api::SessionsController < ApplicationController
  before_action :require_signed_in, only: [:destroy]
  
  def create 
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user 
      sign_in(@user)
      render json: show
    else 
      render json: @user.error.full_messages, status: 401
    end
  end


  def destroy
    sign_out
    render json: {}
  end
end