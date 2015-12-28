FactoryGirl.define do
  factory :food_model do
    brand
    sequence(:name) { |n| "FoodModel #{n}" }
  end

  factory :invalid_food_model, parent: :food_model do
    skip_create
    name nil
  end
end
