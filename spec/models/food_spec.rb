require 'rails_helper'

RSpec.describe Food, type: :model do
  it { is_expected.to validate_presence_of(:food_model) }
end
