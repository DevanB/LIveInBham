class ZipCode < ActiveRecord::Base
	has_many :buildings

	validates_presence_of :zip_code
end