class TodosController < ApplicationController
  
  before_action :authenticate_user!
  
  def new
  end
  
  def create
    @user = User.find(params[:user_id])
    @todo = @user.todos.new(todo_params)
    @todo.save
    redirect_to @user, notice: 'Your new to-do was saved!'
  end
  
  def show
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
    
    if @todo.destroy
      flash[:notice] = "to-do deleted!"
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @user
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
