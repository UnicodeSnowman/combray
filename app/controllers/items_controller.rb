class ItemsController < ApplicationController
  before_action :set_item, only: [:print, :edit, :update, :destroy]
  # before_action to prevent undefined routes from throwing errors
   layout 'print', :only => [:print]

  def index
    @items = Item.search(params)
  end

  def show
      @item = Item.includes(:photos).find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The item you were looking for could not be found.'
      redirect_to items_path
  end

  def print
    # set_item
  end

  private

    def item_params
      params.require(:item).permit(:code, :name, :description, :subcategory_id)
    end

    def set_item
      @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The item you were looking for could not be found.'
      redirect_to items_path
    end

end
