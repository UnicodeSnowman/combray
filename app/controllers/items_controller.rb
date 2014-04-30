class ItemsController < ApplicationController
  layout false, only: [:print]
  prawnto :prawn => { :left_margin => 70, :right_margin => 70, :bottom_margin => 20, :top_margin => 20 }
  before_action :set_item, only: [:print, :edit, :update, :destroy]
  # before_action to prevent undefined routes from throwing errors

  def index
    if (params[:subcategory_id])
      render json: Item.where(subcategory_id: params[:subcategory_id]).as_json(:include => :photos)
    elsif (params[:category_id])
      render json: Item.find_by_category_id(params[:category_id]).as_json(:include => :photos)
    else
      render json: Item.search(params).as_json(:include => :photos)
    end
  end

  def print
    @item = Item.includes(:photos).find(params[:id])
    render "print.pdf.prawn"
  end

  def show
#    if (params[:subcategory_id])
#      render json: Item.where(subcategory_id: params[:subcategory_id]).as_json(:include => :photos)
#    else
    render json: Item.includes(:photos)
                     .find(params[:id])
                     .as_json(:include => :photos)
    #end
#    rescue ActiveRecord::RecordNotFound
#      flash[:alert] = 'The item you were looking for could not be found.'
#      redirect_to items_path
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
