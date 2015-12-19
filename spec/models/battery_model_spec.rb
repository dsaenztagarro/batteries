require 'rails_helper'

describe BatteryModel do
  it { is_expected.to validate_presence_of(:battery_size_id) }
  it { is_expected.to validate_presence_of(:capacity) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:rechargeable) }
  it { is_expected.to validate_uniqueness_of(:name) }

end
