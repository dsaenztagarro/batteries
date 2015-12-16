require 'rails_helper'

describe BatterySize do
  it 'has a valid factory' do
    expect(build(:battery_size)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:battery_size, name: nil)).to_not be_valid
  end

  it { is_expected.to validate_presence_of(:name) }
end
