require 'rails_helper'

describe BatterySizesController do
  describe 'GET new' do
    login_user

    it 'assigns @battery_size a new instance' do
      get :new
      expect(assigns(:battery_size)).to be_a_new(BatterySize)
    end
  end

  describe 'GET index' do
    context 'when user is logged in' do
      login_user

      it 'assigns @battery_sizes' do
        battery_size = BatterySize.create(name: 'AA')
        get :index
        expect(assigns(:battery_sizes)).to eq([battery_size])
      end

      it 'returns a 200 OK status' do
        get :index
        expect(response).to have_http_status(:ok)
      end

      it 'renders the index template' do
        get :index
        expect(response).to render_template('index')
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
