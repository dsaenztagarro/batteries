FactoryGirl.define do
  factory :device_model do
    sequence(:name) { |n| "DeviceModel #{n}" }
    battery_number 0
    battery_size nil

    trait :electronic do
      battery_number 1
      battery_size
    end

    factory :electronic_device_model, traits: [:electronic]
  end

  factory :invalid_device_model, parent: :device_model do
    skip_create
    name nil
  end
end
