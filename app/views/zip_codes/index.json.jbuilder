json.array!(@zip_codes) do |zip_code|
  json.extract! zip_code, :id, :zip_code
  json.url zip_code_url(zip_code, format: :json)
end
