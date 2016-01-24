require 'rails_helper'

describe BatterySizesController do
  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'populates an array of battery sizes' do
        battery_size = build(:battery_size)
        allow(BatterySize).to receive(:all).and_return([battery_size])
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
        allow(BatterySize).to receive(:find).and_return(@battery_size)
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

      before(:each) do
        post :create, battery_size: build(:battery_size).attributes
      end

      it 'redirects to battery size show page' do
        expect(response).to redirect_to(battery_size_path(BatterySize.last))
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, battery_size: build(:battery_size).attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @battery_size = create(:battery_size, name: 'AA')
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        it 'located the requested @battery_size' do
          put :update, id: @battery_size,
                       battery_size: attributes_for(:battery_size)
          expect(assigns(:battery_size)).to eq(@battery_size)
        end

        it "changes @battery_size's attributes" do
          put :update, id: @battery_size,
                       battery_size: attributes_for(:battery_size, name: 'AAA')
          @battery_size.reload
          expect(@battery_size.name).to eq('AAA')
        end

        it 'redirects to the updated battery_size' do
          put :update, id: @battery_size,
                       battery_size: attributes_for(:battery_size)
          expect(response).to redirect_to @battery_size
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @battery_size,
                       battery_size: attributes_for(:invalid_battery_size)
        end
        it 'locates the requested @battery_size' do
          expect(assigns(:battery_size)).to eq(@battery_size)
        end

        it "does not change @battery_size's attributes" do
          @battery_size.reload
          expect(@battery_size.name).to eq('AA')
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @battery_size,
                     battery_size: attributes_for(:battery_size)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @battery_size = create(:battery_size)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the battery_size' do
        expect do
          delete :destroy, id: @battery_size
        end.to change(BatterySize, :count).by(-1)
      end

      it 'redirects to battery_sizes#index' do
        delete :destroy, id: @battery_size
        expect(response).to redirect_to battery_sizes_url
      end
    end
  end
end
