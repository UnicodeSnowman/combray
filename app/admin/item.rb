ActiveAdmin.register Item do

  ActiveAdmin.register Photo do
    belongs_to :item, :optional => true
  end

  controller do
    def scoped_collection
      Item.includes(:photos)
    end

    def permitted_params
      params.permit item: [:name, :code, :description, :subcategory_id, :sold, :age, :measurements, photos_attributes: [:id, :photo, :item_id, :_destroy]]
    end
  end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  #permit_params :name, :code, :description, :subcategory_id, :photos_attributes, :photos

  form(:html => { :multipart => true }) do |f|
    f.inputs "Details" do
      f.input :name
      f.input :code
      f.input :age
      f.input :measurements
      f.input :subcategory
      f.input :description
      f.input :sold
    end
    f.has_many :photos do |p|
      unless p.object.new_record?
        p.input :_destroy, :as => :boolean, :label => "Delete Image?", :required => false
      end
      p.input :photo, :hint => image_tag(p.object.photo.thumb.url)
    end
    f.actions
  end

  index do
    column :name
    column :description
    column :subcategory
    default_actions
  end

  show do |item|
    attributes_table do
      row :name
      row :code
      row :description
      row :subcategory
      unless item.photos.empty?
        row "Images" do
          ul do
            item.photos.each do |photo|
              li do
                image_tag(photo.photo.thumb.url)
              end
            end
          end
        end
      end
    end
  end

  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
