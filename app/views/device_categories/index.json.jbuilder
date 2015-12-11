json.array!(@device_categories) do |device_category|
  json.extract! device_category, :id, :name
  json.url device_category_url(device_category, format: :json)
end
