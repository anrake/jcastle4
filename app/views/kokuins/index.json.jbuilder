json.array!(@kokuins) do |kokuin|
  json.extract! kokuin, :id
  json.url kokuin_url(kokuin, format: :json)
end
