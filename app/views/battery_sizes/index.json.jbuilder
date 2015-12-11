json.array!(@battery_sizes) do |battery_size|
  json.extract! battery_size, :id
  json.url battery_size_url(battery_size, format: :json)
end
