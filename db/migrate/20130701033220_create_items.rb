class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :code
      t.string :name
      t.string :description
      t.string :size
      t.string :year
      t.string :origin

      t.timestamps
    end
  end
end
