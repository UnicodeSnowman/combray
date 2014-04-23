class AddOriginToItems < ActiveRecord::Migration
  def change
    add_column :items, :origin, :string
  end
end
