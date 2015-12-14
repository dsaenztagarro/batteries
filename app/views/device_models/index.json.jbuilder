json.array!(@device_models) do |device_model|
  json.extract! device_model, :id
  json.url device_model_url(device_model, format: :json)
end
