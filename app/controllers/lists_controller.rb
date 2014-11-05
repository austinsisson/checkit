class ListsController < ApplicationController
  
  def new
  end
  
  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list, notice: 'Your new to-do was saved!'
  end
  
  def show
    @list = List.find params[:id]
  end
  private
  
  def list_params
    params.require(:list).permit(:description)
  end
end
