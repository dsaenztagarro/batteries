FactoryGirl.define do
  factory :brand do
    sequence(:name) { |n| "Brand #{n}" }
  end

  factory :invalid_brand, parent: :brand do
    skip_create
    name nil
  end
end
