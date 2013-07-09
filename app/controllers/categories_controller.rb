class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  
  def index
    @categories = Category.all
    @items = Item.all
  end

  def show
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      flash[:notice] = 'Category has been created.'
      redirect_to categories_path
    else
      flash[:alert] = 'Category has not been created.'
      render :action => 'new'
    end
  end

  def edit
  end

  def update

    if @category.update(category_params)
      flash[:notice] = 'Category has been updated.'
      redirect_to @category
    else
      flash[:error] = 'Category has not been updated.'
      render :action => 'edit'
    end

  end

  def destroy
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
