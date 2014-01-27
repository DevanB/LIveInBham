collection @units

attributes :id, :title
node :address do |units|
	units.building.address + " " + units.building.city + " " + units.building.state + ", " + units.building.zip_code.zip_code
end
node :imageUrl do |units|
	if units.image.blank?
		"http://www.liveinbirmingham.co/assets/default.jpg"
	else "http://www.liveinbirmingham.co" + units.image.url(:main)
	end
end