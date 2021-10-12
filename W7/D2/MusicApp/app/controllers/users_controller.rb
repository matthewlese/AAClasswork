class UsersController < ApplicationController
  #here we write methods for the actions coresponding to the routes
  def index
    @users = User.all
    render :index
  end

  def new #request form to accept new user credentials
    @user = User.new #create empty user instance so we don't get nil errors
    render :new #render new form
  end

  def create #post new user
    @user = User.new(user_params) #create user instance with params
    if @user.save #try to save
      login(@user) #log in if successful w save
      redirect_to users_url #redirect to users index
    else #save unsuccessful
      flash.now[:errors] = @user.errors.full_messages #flash error message(s) for current req/resp cycle
      render :new #re-render new page
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
    #digest and session token are handled by helper methods and user will never touch them
  end

end
