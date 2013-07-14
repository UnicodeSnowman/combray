class SubcategoriesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
    @items = @subcategory.items
  end


  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
