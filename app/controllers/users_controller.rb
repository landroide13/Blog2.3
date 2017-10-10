class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      flash[:success] = "User successfully created.."
      redirect_to articles_path
    else
      flash[:danger] = "Ups, somethings comming up, try again..."
      render 'new'
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  

end