class Add < ActiveRecord::Migration
  def change
    add_column :items, :age, :string
    add_column :items, :measurements, :string
  end
end
