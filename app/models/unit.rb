class Unit < ActiveRecord::Base
  belongs_to :category
  belongs_to :building

  validates_presence_of :number, :avail_date, :category, :building, :title, :description, :bedrooms, :bathrooms, :price
end
