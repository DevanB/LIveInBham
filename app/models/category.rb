class Category < ActiveRecord::Base
	has_many :units
	validates_presence_of :name, :catBegin, :catEnd
end
