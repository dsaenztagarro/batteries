require 'rails_helper'

describe BatteryPack do
  it { is_expected.to validate_presence_of(:battery_pack_model) }
end
