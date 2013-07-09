class Subcategory < ActiveRecord::Base
  validates :name, presence: true
  validates :category_id, presence: true

  has_many :items
  belongs_to :category
end
