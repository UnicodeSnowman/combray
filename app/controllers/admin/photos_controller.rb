class Admin::PhotosController < ApplicationController
  before_action :authorize_admin!

  def new
    @item = Item.new
    photo = @item.photos.build

    render partial: 'admin/photos/form',
          locals: { number: params[:number].to_i, photo: photo }
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    flash[:notice] = 'Photo has been deleted'

    redirect_to edit_admin_item_path(params[:item_id])
  end
end
