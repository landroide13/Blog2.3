class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy, :show] 
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @users = User.paginate(page: params[:page], per_page: 2)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Black Flag #{@user.username}"
      redirect_to user_path(@user)
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
    @user_articles = @user.articles.paginate(page: params[:page], per_page: 2)
  end

  def destroy
    @user.destroy
    flash[:danger] = "User Successfully deleted.."
    redirect_to users_path
  end


  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
  
  def require_same_user
    if  current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account.."
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Sorry, you are not Admin.."
      redirect_to root_path
    end
  end

end