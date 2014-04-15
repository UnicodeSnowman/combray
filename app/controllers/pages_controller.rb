class PagesController < ApplicationController
  before_action :set_page

  def home
  end

  def about
  end

  def contact
  end

  def services
    render json: set_page
  end

  def set_page
    Page.find_by_title(params[:action])
  end
end
