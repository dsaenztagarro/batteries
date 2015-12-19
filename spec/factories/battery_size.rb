FactoryGirl.define do
  factory :battery_size do
    sequence(:name) { |n| "BatterySize #{n}" }
  end

  factory :invalid_battery_size, parent: :battery_size do
    skip_create
    name nil
  end
end
