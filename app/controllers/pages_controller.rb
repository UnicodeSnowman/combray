class PagesController < ApplicationController
  before_action :set_page

  def home
  end

  def about
  end

  def contact
  end

  def set_page
    page = Page.find_by_title(params[:action])
    @title = page.title.titleize
    @text = page.text
  end
end
