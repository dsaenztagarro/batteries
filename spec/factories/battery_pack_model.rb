FactoryGirl.define do
  factory :battery_pack_model do
    battery_model
    size 4
  end

  factory :invalid_battery_pack_model, parent: :battery_pack_model do
    skip_create
    battery_model nil
  end
end
