class TodosController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.find(params[:user_id])
    @todo = @user.todos.new(todo_params)
    @todo.save
    redirect_to @user, notice: 'Your new to-do was saved!'
  end
  
  def show
    @todo = Todo.find params[:id]
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:description)
  end
end
