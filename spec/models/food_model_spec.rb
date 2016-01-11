require 'rails_helper'

RSpec.describe FoodModel, type: :model do
  subject { FactoryGirl.build(:food_model) }
  it { is_expected.to validate_presence_of(:brand) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
