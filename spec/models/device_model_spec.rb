require 'rails_helper'

describe DeviceModel do
  it { is_expected.to validate_presence_of(:battery_number) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
end
