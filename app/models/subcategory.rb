class Subcategory < ActiveRecord::Base
  validates :name, presence: true
  validates :category_id, presence: true

  has_many :items, :dependent => :destroy
  belongs_to :category
end
