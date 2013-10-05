class SubcategoriesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
    @items = @subcategory.items

    render partial:  '/items/items_list', :locals => { items: @items } if request.xhr?
  end


  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
