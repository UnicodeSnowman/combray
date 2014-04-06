class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update]
  
  def index
    render json: Category.includes(:subcategories).all.as_json(:include => :subcategories)
    #category = Photo.find_by_title('category')
    #@category_image_url = category.photo.url if category
  end

  def show
    @categories = Category.includes(:subcategories).all
    @items = @category.items
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
