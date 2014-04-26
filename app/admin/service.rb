ActiveAdmin.register Service do

  menu :label => "Services Page", :priority => 4
  actions :all, :except => [:new, :destroy]
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  permit_params :service, :body_top, :body_bottom, :title_top, :title_bottom
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
