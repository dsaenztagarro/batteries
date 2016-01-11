require 'rails_helper'

describe DeviceModel do
  subject { FactoryGirl.build(:device_model) }
  it { is_expected.to validate_presence_of(:battery_number) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }
end
