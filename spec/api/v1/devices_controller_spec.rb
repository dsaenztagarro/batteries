require 'rails_helper'

describe API::V1::Devices do
  describe 'GET /api/v1/devices' do
    it 'returns an empty array of devices' do
      get '/api/v1/devices'
      expect(response).to be_success
			expect(json).to eq([])
    end
  end
end
