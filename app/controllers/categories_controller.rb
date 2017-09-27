class CategoriesController < ApplicationController
  def new
    @category = Category.new
    @user = User.find(session[:user_id])
  end

  def create
    @category = Category.new(category_params)
    @user = User.find(session[:user_id])
    @category.user = @user
    
    if @category.save
      redirect_to todos_path
    else
      render :new
    end
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end
end
