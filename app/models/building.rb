class Building < ActiveRecord::Base
	belongs_to :zip_code
	has_many :units

	validates_presence_of :name, :address, :city, :state, :zip_code

	geocoded_by :full_address
	after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

	def full_address
		return address + city + state
	end
end
