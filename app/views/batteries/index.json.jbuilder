json.array!(@batteries) do |battery|
  json.extract! battery, :id
  json.url battery_url(battery, format: :json)
end
