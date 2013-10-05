class Category < ActiveRecord::Base
  validates :name, :presence => true
  has_many :subcategories, :dependent => :destroy
  has_many :items, :through => :subcategories, :dependent => :destroy

#  def self.all_with_subcategories(id)
#    self.find(id).includes(:subcategories)
#  end
end
