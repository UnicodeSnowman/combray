class RemoveHoursFromContacts < ActiveRecord::Migration
  def change
    remove_column :contacts, :hours
  end
end
