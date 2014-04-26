class PagesController < ApplicationController
  def services
    render json: Service.first
  end

  def contact
    render json: Contact.first
  end

  def about
    render json: About.first
  end
end
