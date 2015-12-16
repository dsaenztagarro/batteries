FactoryGirl.define do
  factory :battery_size do
    sequence(:name) {|n| "BatterySize #{n}" }
  end
end
