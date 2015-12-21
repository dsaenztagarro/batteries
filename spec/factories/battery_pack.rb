FactoryGirl.define do
  factory :battery_pack do
    battery_pack_model
  end

  factory :invalid_battery_pack, parent: :battery_pack do
    skip_create
    battery_pack_model nil
  end
end
