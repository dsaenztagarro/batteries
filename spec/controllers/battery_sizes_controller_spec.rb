require 'rails_helper'

describe BatterySizesController do
  login_user

  describe 'GET index' do
    it "assigns @battery_sizes" do
      battery_size = BatterySize.create(name: 'AA')
      get :index
      expect(assigns(:battery_sizes)).to eq([battery_size])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end
end
