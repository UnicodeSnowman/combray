class Item < ActiveRecord::Base
  validates :subcategory_id, :presence => true
  validates :name, :presence => true
  validates :description, :presence => true
  validates :code, :presence => true, :uniqueness => true

  belongs_to :subcategory
  #has_one :category, :through => :subcategory
  delegate :category, :to => :subcategory
  has_many :photos, :dependent => :destroy
  accepts_nested_attributes_for :photos, :allow_destroy => true
  #mount_uploader :photo, PhotoUploader
  
  def self.search(params)
    if params
      find(:all, :conditions => [
        "name LIKE ? OR description LIKE ? OR subcategory LIKE ?", 
        "%#{params[:q]}%", 
        "%#{params[:q]}%", 
        "%#{params[:q]}%"])
    else
      find(:all)
    end
  end
end
