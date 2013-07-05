class AddSubcategoryToItem < ActiveRecord::Migration
  def change
    add_reference :items, :subcategory, index: true
  end
end
