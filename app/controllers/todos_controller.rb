class TodosController < ApplicationController
  
  respond_to :html, :js
  
  before_action :authenticate_user!
  
  def new
  end
  
  def create
    @user = User.find(params[:user_id])
    @todo = @user.todos.new(todo_params)
    
    if @todo.save
      flash[:notice] = 'Your new to-do was saved!'
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @user
  end
  
  def show
  end
  
  def destroy
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
    
    if @todo.destroy
      flash[:notice] = "Your to-do was deleted!"
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    redirect_to @user
  end
  
  def update
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
    
    if @todo.update_attributes(todo_params)
      flash[:notice] = "Your to-do has been completed!"
    else
      flash[:error] = "An error occurred, please try again."
    end
    
    respond_with(@todo) do |format|
      format.html { redirect_to @todo }
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
