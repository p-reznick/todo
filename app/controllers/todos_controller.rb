class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @new_todo = Todo.create(params.require(:todo).permit(:title, :description, :due_date))

    if @new_todo.save
      redirect_to todos_path
    else
      render :new
    end
  end
end
