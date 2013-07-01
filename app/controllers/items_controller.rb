class ItemsController < ApplicationController

  def index

  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = 'Item has been created.'
      redirect_to @item
    else
      flash[:alert] = 'Item has not been created.'
      render :action => 'new'
    end
  end

  private

    def item_params
      params.require(:item).permit(:code, :name, :description, :size, :year, :origin)
    end
end
