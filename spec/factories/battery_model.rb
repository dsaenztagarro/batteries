FactoryGirl.define do
  factory :battery_model do
    sequence(:name) { |n| "BatteryModel #{n}" }
    capacity 2000
    battery_size
    rechargeable false

    trait :rechargeable do
      rechargeable true
    end

    factory :rechargeable_battery_model, traits: [:rechargeable]
  end

  factory :invalid_battery_model, parent: :battery_model do
    skip_create
    name nil
  end
end
