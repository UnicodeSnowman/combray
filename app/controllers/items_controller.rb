class ItemsController < ApplicationController
  before_action :set_item, only: [:print, :edit, :update, :destroy]
  # before_action to prevent undefined routes from throwing errors
   layout 'print', :only => [:print]

  def index
    render json: Item.search(params).as_json(:include => :photos)
  end

  def show
    if (params[:subcategory_id])
      render json: Item.includes(:photos).find_by(:subcategory_id => params[:subcategory_id]).as_json(:include => :photos)
    else
      render json: Item.includes(:photos)
                       .find(params[:id])
                       .as_json(:include => :photos)
    end
#    rescue ActiveRecord::RecordNotFound
#      flash[:alert] = 'The item you were looking for could not be found.'
#      redirect_to items_path
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
