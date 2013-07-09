class SubcategoriesController < ApplicationController

  def show
    @category = Category.find(params[:category_id])
    @subcategory = Subcategory.find(params[:id])
    @items = @subcategory.items
  end

  def new
    @subcategory = Subcategory.new
  end

  def create
    @subcategory = Subcategory.new(subcategory_params)

    if @subcategory.save
      flash[:notice] = 'Subcategory has been created.'
      redirect_to '/'    
    else
      flash[:error] = 'Subcategory has not been created.'
      render :action => 'new'
    end

  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end
