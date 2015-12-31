require 'rails_helper'

describe DeviceModelsController do
  let(:valid_attributes) { build(:device_model).attributes }
  let(:invalid_attributes) { attributes_for(:invalid_device_model) }

  describe 'GET #index' do
    context 'when user is logged in' do
      # login_user

      it 'assigns all device models as @device_models' do
        sign_in
        device_model = build(:device_model)
        allow(DeviceModel).to receive(:all).and_return([device_model])
        get :index
        expect(assigns(:device_models)).to eq([device_model])
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
        @device_model = create(:device_model)
        allow(DeviceModel).to receive(:find).and_return(@device_model)
        get :show, id: @device_model
      end

      it 'assigns the requested device model as @device_model' do
        expect(assigns(:device_model)).to eq(@device_model)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:device_model)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @device_model a new instance' do
        get :new
        expect(assigns(:device_model)).to be_a_new(DeviceModel)
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

      context 'with valid params' do
        it 'creates a new DeviceModel' do
          expect do
            post :create, device_model: valid_attributes
          end.to change(DeviceModel, :count).by(1)
        end

        it 'assigns a newly created device model as @device_model' do
          post :create, device_model: valid_attributes
          expect(assigns(:device_model)).to be_a(DeviceModel)
          expect(assigns(:device_model)).to be_persisted
        end

        it 'redirects to the created device model' do
          post :create, device_model: valid_attributes
          expect(response).to redirect_to(DeviceModel.last)
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved device model' \
           'as @device_model' do
          post :create, device_model: invalid_attributes
          expect(assigns(:device_model)).to be_a_new(DeviceModel)
        end

        it "re-renders the 'new' template" do
          post :create, device_model: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, device_model: valid_attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @device_model = create(:device_model, name: 'Energizer')
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        it 'located the requested @device_model' do
          put :update, id: @device_model, device_model: valid_attributes
          expect(assigns(:device_model)).to eq(@device_model)
        end

        it "changes @device_model's attributes" do
          new_attributes = attributes_for(:device_model, name: 'Duracell')
          put :update, id: @device_model, device_model: new_attributes
          @device_model.reload
          expect(@device_model.name).to eq('Duracell')
        end

        it 'redirects to the updated device_model' do
          put :update, id: @device_model,
                       device_model: attributes_for(:device_model)
          expect(response).to redirect_to @device_model
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @device_model,
                       device_model: attributes_for(:invalid_device_model)
        end
        it 'locates the requested @device_model' do
          expect(assigns(:device_model)).to eq(@device_model)
        end

        it "does not change @device_model's attributes" do
          @device_model.reload
          expect(@device_model.name).to eq('Energizer')
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @device_model,
                     device_model: attributes_for(:device_model)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @device_model = create(:device_model)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the device_model' do
        expect do
          delete :destroy, id: @device_model
        end.to change(DeviceModel, :count).by(-1)
      end

      it 'redirects to device_models#index' do
        delete :destroy, id: @device_model
        expect(response).to redirect_to device_models_url
      end
    end
  end
end
