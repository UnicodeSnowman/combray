class AddTextToContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :hours
    remove_column :contacts, :body
    add_column :contacts, :hours, :text
    add_column :contacts, :body, :text
  end
end
