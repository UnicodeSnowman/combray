class Admin::CategoriesController < ApplicationController
  before_action :authorize_admin! # ApplicationController method
  before_action :set_category, only: [:show, :edit, :update]

  def index
    @categories = Category.all
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
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(category_params)
      flash[:notice] = 'Category has been updated.'
      redirect_to admin_categories_path
    else
      flash[:error] = 'Category has not been updated.'
      render :action => 'edit'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def set_category
    @category = Category.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = 'The category you were looking for could not be found.'
    redirect_to admin_categories_path
  end
end
