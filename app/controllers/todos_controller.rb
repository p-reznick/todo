class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :update]
  def index
    @todos = Todo.all
    @new_todo = Todo.new
  end

  def new
    @todo = Todo.new
  end

  def create
    @new_todo = Todo.create(todo_params)

    if @new_todo.save
      redirect_to todos_path
    else
      render :new
    end
  end

  def edit

  end

  def update
    if @todo.update(todo_params)
      redirect_to todo_path(@todo)
    else
      render :edit
    end
  end

  def show

  end

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
