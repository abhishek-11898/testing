class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new 
    @user = User.new
  end

  def show 
    @user = User.find(params[:id])
    @freinds = @user.freinds
    @requests = @user.requested_freinds
    @pending = @user.pending_freinds
  end

  def edit 
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to users_url
    else
      render :new, notice: "Unable To Update Your Account"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      session[:user_id] = nil
      redirect_to users_url
    else
      redirect_to root_path, notice: "Unable To Delete Your Account"
    end
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end

