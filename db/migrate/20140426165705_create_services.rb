class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :title_top
      t.string :title_bottom
      t.string :body_top
      t.string :body_bottom

      t.timestamps
    end
  end
end
