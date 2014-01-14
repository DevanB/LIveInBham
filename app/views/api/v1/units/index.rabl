collection @units

attributes :featured, :number, :avail_date, :title, :description, :bedrooms, :bathrooms, :price, :link

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