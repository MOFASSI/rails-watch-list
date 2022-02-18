class ListsController < ApplicationController

  before_action :current_list, only: [:show]
  def index
    @lists = List.all
  end

  def show

  end


  def new
    @list = List.new
  end

  def create
    @list = List.new(params_list)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end


  private

  def params_list
  params.require(:list).permit(:name)
  end

  def current_list
    @list = List.find(params[:id])
  end
end
