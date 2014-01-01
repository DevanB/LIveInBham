json.array!(@units) do |unit|
  json.extract! unit, :id, :featured, :number, :avail_date, :category_id, :building_id, :title, :description, :bedrooms, :bathrooms, :price, :link, :image
  json.url unit_url(unit, format: :json)
end
