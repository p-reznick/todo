class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def new; end

  def create
    @user = User.create(user_params)

    if @user.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit
    if params[:id].to_i != session[:user_id].to_i
      redirect_to todos_path
    else
      render :edit
    end
  end

  def show
    if params[:id].to_i != session[:user_id].to_i
      redirect_to todos_path
    else
      render :show
    end
  end

  def update
    @user = User.find(session[:user_id])

    if @user.update(user_params)
      redirect_to todos_path
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
