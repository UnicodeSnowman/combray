class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  # before_action to prevent undefined routes from throwing errors

  def index
    @items = Item.all
  end

  def show
    # set_item
  end

  private

    def item_params
      params.require(:item).permit(:code, :name, :description, :size, :year, :origin, :subcategory_id)
    end

    def set_item
      @item = Item.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:alert] = 'The item you were looking for could not be found.'
      redirect_to items_path
    end

end
