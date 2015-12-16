require 'rails_helper'

describe BatterySizesController do
  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'populates an array of battery sizes' do
        battery_size = BatterySize.create(name: 'AA')
        get :index
        expect(assigns(:battery_sizes)).to eq([battery_size])
      end

      it 'renders the :index view' do
        get :index
        expect(response).to render_template('index')
      end

      it 'returns a 200 OK status' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #show' do
    context 'when user is logged in' do
      login_user

      before(:each) do
        @battery_size = create(:battery_size)
        get :show, id: @battery_size
      end

      it 'assigns the requested battery size to @battery_size' do
        expect(assigns(:battery_size)).to eq(@battery_size)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:battery_size)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @battery_size a new instance' do
        get :new
        expect(assigns(:battery_size)).to be_a_new(BatterySize)
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :new
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    context 'when user is logged in' do
      login_user

    end
  end
end
