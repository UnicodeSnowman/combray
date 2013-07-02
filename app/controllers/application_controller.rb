class ApplicationController < ActionController::Base
  before_filter :load_nav

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected
    def load_nav
      @test_thing = 'blah blah blah'
      #@categories = Category.all
      @categories = [{'name' => 'Category 1'}, {'name' => 'Category 2'}, {'name' => 'Category 3'}]
    end
end
