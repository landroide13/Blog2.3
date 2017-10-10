class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show] 

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

  def edit
  end

  def update
    if @user = User.update(user_params)
      flash[:success] = "User Updated Successfully.."
      redirect_to articles_path
    else
      flash[:danger] = "Ups, something comming up, try again.."
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user.destroy
    flash[:danger] = "User Successfully deleted.."
    redirect_to articles_path
  end



  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
  

end