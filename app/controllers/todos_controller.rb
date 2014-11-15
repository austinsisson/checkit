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
    
    redirect_to root_path
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
    
    redirect_to root_path
  end
  
  def update
    @user = User.find(params[:user_id])
    @todo = @user.todos.find(params[:id])
    
    flash[:error] = "An error occurred, please try again." if !@todo.update_attributes(todo_params)
    
    respond_with(@todo) do |format|
      format.html { redirect_to root_path }
    end
  end
  
  private
  
  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
