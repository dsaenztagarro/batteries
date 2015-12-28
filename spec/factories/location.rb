FactoryGirl.define do
  factory :location do
    sequence(:name) { |n| "Location #{n}" }
  end

  factory :invalid_location, parent: :location do
    skip_create
    name nil
  end
end
