class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :photo
      t.references :item
      t.timestamps
    end

    remove_column :items, :photo
  end
end
