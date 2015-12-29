FactoryGirl.define do
  factory :food do
    food_model
  end

  factory :invalid_food, parent: :food do
    skip_create
    food_model nil
  end
end
