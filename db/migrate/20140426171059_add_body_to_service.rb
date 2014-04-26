class AddBodyToService < ActiveRecord::Migration
  def change
    remove_column :services, :body_top
    remove_column :services, :body_bottom
    add_column :services, :body_top, :text
    add_column :services, :body_bottom, :text
  end
end
