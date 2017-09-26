class UsersController < ApplicationController
  before_action :set_user

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
  end

  def update
  end

  private

  def set_user
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
