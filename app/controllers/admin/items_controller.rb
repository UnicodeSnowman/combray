class Admin::ItemsController < ApplicationController
  before_action :authorize_admin!
  before_action :set_item, only: [:show, :edit, :update]

  def new
    @item = Item.new
    @categories = Category.all
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      flash[:notice] = 'Item has been created.'
      redirect_to admin_items_path
    else
      flash[:alert] = 'Item has not been created.'
      render :action => 'new'
    end
  end

  def show
    # set_item
  end

  def edit
    # set_item
  end

  def update

    # set_item

    if @item.update(item_params)
      flash[:notice] = 'Item has been updated.'
      redirect_to admin_item_path(@item)
    else
      flash[:error] = 'Item has not been updated.'
      render :action => 'edit'
    end
  end

  def destroy

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
    params.require(:item).permit(:code, :name, :description, :size, :year, :origin, :subcategory_id, :photo)
  end

  def set_item
    @item = Item.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The item you were looking for could not be found.'
    redirect_to admin_categories_path
  end
      
end
