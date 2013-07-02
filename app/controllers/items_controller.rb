class ItemsController < ApplicationController

  def index
    @items = Item.all
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

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    
    if @item.update(item_params)
      flash[:notice] = 'Item has been updated.'
      redirect_to @item
    else
      flash[:error] = 'Item has not been updated.'
      render :action => 'edit'
    end
  end

  def destroy
    @item = Item.find(params[:id])

    if @item.destroy
      flash[:notice] = 'Item has been removed.'
      redirect_to items_path
    else
      flash[:error] = 'Item removal failed, something went wrong.'
      redirect_to item_path(params[:id])
    end

  end

  private

    def item_params
      params.require(:item).permit(:code, :name, :description, :size, :year, :origin)
    end
end
