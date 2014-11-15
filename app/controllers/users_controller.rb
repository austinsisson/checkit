class UsersController < ApplicationController
  
  before_action :authenticate_user!
  
  def show
    
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    
    unless @user == current_user
      redirect_to root_path, alert: 'Sorry, you can only view your own to-do lists!'
    end
        
  end

  def update
  end
  
end
