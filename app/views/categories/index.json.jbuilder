json.array!(@categories) do |category|
  json.extract! category, :id, :name, :catBegin, :catEnd
  json.url category_url(category, format: :json)
end
