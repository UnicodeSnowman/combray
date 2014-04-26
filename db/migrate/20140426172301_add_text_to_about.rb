class AddTextToAbout < ActiveRecord::Migration
  def change
    remove_column :abouts, :body
    add_column :abouts, :body, :text
  end
end
