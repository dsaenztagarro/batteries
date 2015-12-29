json.array!(@foods) do |food|
  json.extract! food, :id, :food_model_id
  json.url food_url(food, format: :json)
end
