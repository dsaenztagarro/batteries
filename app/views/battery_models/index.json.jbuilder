json.array!(@battery_models) do |battery_model|
  json.extract! battery_model, :id
  json.url battery_model_url(battery_model, format: :json)
end
