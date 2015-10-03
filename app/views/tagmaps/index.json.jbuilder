json.array!(@tagmaps) do |tagmap|
  json.extract! tagmap, :id
  json.url tagmap_url(tagmap, format: :json)
end
