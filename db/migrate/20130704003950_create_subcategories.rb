class CreateSubcategories < ActiveRecord::Migration
  def change
    create_table :subcategories do |t|
      t.references :category
      t.string :name

      t.timestamps
    end
  end
end
