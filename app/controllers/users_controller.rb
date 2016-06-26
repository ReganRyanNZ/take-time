class UsersController < ApplicationController
before_action :set_user, only: [:edit, :update, :show]
before_action :require_same_user, only: [:edit, :update, :destroy]
before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to Take Time, #{@user.username}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfully"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:danger] = "User has been deleted"
    redirect_to root_path
  end
  
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admin users can perform that action"
      redirect_to root_path
    end
  end

end