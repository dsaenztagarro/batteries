require 'rails_helper'

describe BatteryModel do
  subject { FactoryGirl.build(:battery_model) }
  it { is_expected.to validate_presence_of(:battery_size_id) }
  it { is_expected.to validate_presence_of(:capacity) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).case_insensitive }

  describe '#fullname' do
    before :each do
      AA = build(:battery_size, name: 'AA')
      @battery_model = build(:rechargeable_battery_model, battery_size: AA,
                                                          capacity: 2400,
                                                          name: 'Energizer')
    end
    context 'rechargeable battery' do
      it 'returns the battery model fullname' do
        expect(@battery_model.fullname).to eql(
          'Energizer AA 2400mAh Rechargeable')
      end
    end
  end
end
