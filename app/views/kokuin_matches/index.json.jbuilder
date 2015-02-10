json.array!(@kokuin_matches) do |kokuin_match|
  json.extract! kokuin_match, :id
  json.url kokuin_match_url(kokuin_match, format: :json)
end
