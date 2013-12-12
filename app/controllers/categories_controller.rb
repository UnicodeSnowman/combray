class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  
  def index
    @categories = Category.all
    @items = Item.all
  end

  def show
    @items = @category.items
    render partial: '/items/items_list', :locals => { items: @items } if request.xhr?
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The category you were looking for could not be found.'
    redirect_to categories_path
  end
end
