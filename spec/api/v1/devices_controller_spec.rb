require 'spec_helper'

describe 'API::V1::Devices' do
  describe 'GET /api/v1/devices' do
    get '/api/v1/devices'
    response.status.should == 200
    JSON.parse(response.body).should == []
  end
end
