json.array!(@food_models) do |food_model|
  json.extract! food_model, :id, :brand, :name
  json.url food_model_url(food_model, format: :json)
end
