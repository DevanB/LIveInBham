class Unit < ActiveRecord::Base
  before_create :set_featured
  after_destroy :delete_image

  belongs_to :category
  belongs_to :building

  mount_uploader :image, ImageUploader
  process_in_background :image
  store_in_background :image

  scope :featured, -> { where(featured: 1) }

  validates_presence_of :number, :avail_date, :category, :building, :title, :description, :bedrooms, :bathrooms, :price

  def set_featured 
  	self.featured = 0
  end
  def delete_image
    self.remove_image!
  end
end
