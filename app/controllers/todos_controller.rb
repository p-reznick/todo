class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update]
  before_action :require_user, only: [:new, :create, :complete, :update, :destroy]

  def index
    @todos = Todo.where(user_id: session[:user_id]).order(:completed, :due_date)
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = session[:user_id]

    if @todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def complete
    todo = Todo.find(params[:id])
    todo.completed = true
    todo.save!
    redirect_to todos_path
  end

  def edit;end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def show;end

  def destroy
    Todo.destroy(params[:id])
    redirect_to todos_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :description, :due_date)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end
