collection @units

attributes :featured, :number, :avail_date, :title, :description, :bedrooms, :bathrooms, :price, :phoneNum, :link

node :address do |units|
	units.building.address + " " + units.building.city + " " + units.building.state + ", " + units.building.zip_code.zip_code
end

node :imageUrl do |units|
	if units.image.blank?
		"http://www.liveinbirmingham.co/assets/default.jpg"
	else "http://www.liveinbirmingham.co" + units.image.url(:main)
	end
end
node :imageThumbUrl do |units|
	if units.image.blank?
		"http://www.liveinbirmingham.co/assets/thumb.jpg"
	else "http://www.liveinbirmingham.co" + units.image.url(:thumb)
	end
end
node :latitude do |units|
	units.building.latitude
end
node :longitude do |units|
	units.building.longitude
end