collection @units

attributes :featured, :number, :avail_date, :title, :description, :bedrooms, :bathrooms, :price, :link

node :imageUrl do |units|
	if units.image.blank?
		"http://www.liveinbham.co/assets/default.jpg"
	else "http://www.liveinbham.co" + units.image.url(:main)
	end
end
node :imageThumbUrl do |units|
	if units.image.blank?
		"http://www.liveinbham.co/assets/thumb.jpg"
	else "http://www.liveinbham.co" + units.image.url(:thumb)
	end
end