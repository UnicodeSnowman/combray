class Admin::SubcategoriesController < ApplicationController
  def index
    @subcategories = Subcategory.all
  end

  def show
    @subcategory = Subcategory.find(params[:id])
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

  def edit
    @subcategory = Subcategory.find(params[:id])    
  end

  def update
    @subcategory = Subcategory.find(params[:id]) 

    if @subcategory.update(subcategory_params)
      flash[:notice] = 'Subcategory has been updated.'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Subcategory has not been updated.' 
      render :action => 'edit'
    end
  end

  private

  def subcategory_params
    params.require(:subcategory).permit(:name, :category_id)
  end
end