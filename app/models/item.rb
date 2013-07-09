class Item < ActiveRecord::Base
  validates :subcategory_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :code, :presence => true, :uniqueness => true

  belongs_to :subcategory
end
