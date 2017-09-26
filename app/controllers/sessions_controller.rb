class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.where(username: params[:username]).first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Welcome to your todos!"
      redirect_to todos_path
    else
      flash[:error] = "Wrong username or password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to todos_path
  end
end
