class Remove < ActiveRecord::Migration
  def change
    remove_column :items, :size
    remove_column :items, :year
    remove_column :items, :origin
  end
end

# size year origin
