class Item < ActiveRecord::Base
  validates :name, :presence => true
  validates :description, :presence => true
  validates :code, :presence => true, :uniqueness => true

  belongs_to :category
end
