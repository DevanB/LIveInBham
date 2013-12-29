json.array!(@buildings) do |building|
  json.extract! building, :id, :name, :address, :city, :state, :zip_code_id, :latitude, :longitude
  json.url building_url(building, format: :json)
end
