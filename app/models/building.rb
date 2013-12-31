class Building < ActiveRecord::Base
	has_one :zip_code

	geocoded_by :full_address
	after_validation :geocode, :if => lambda{ |obj| obj.address_changed? }

	def full_address
		return address + city + state
	end
end
