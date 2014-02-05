class Photo < ActiveRecord::Base
  mount_uploader :photo, PhotoUploader
  validates :title, :uniqueness => true
  belongs_to :item
end
