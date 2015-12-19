require 'rails_helper'

describe BatteryModelsController do
  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'populates an array of battery models' do
        battery_model = build(:battery_model)
        allow(BatteryModel).to receive(:all).and_return([battery_model])
        get :index
        expect(assigns(:battery_models)).to eq([battery_model])
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
        @battery_model = create(:battery_model)
        allow(BatteryModel).to receive(:find).and_return(@battery_model)
        get :show, id: @battery_model
      end

      it 'assigns the requested battery model to @battery_model' do
        expect(assigns(:battery_model)).to eq(@battery_model)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:battery_model)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @battery_model a new instance' do
        get :new
        expect(assigns(:battery_model)).to be_a_new(BatteryModel)
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
        post :create, battery_model: build(:battery_model).attributes
      end

      it 'redirects to battery model show page' do
        expect(response).to redirect_to(battery_model_path(BatteryModel.last))
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, battery_model: build(:battery_model).attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @battery_model = create(:battery_model, name: 'Energizer')
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        it 'located the requested @battery_model' do
          put :update, id: @battery_model, battery_model: attributes_for(:battery_model)
          expect(assigns(:battery_model)).to eq(@battery_model)
        end

        it "changes @battery_model's attributes" do
          put :update, id: @battery_model,
                       battery_model: attributes_for(:battery_model, name: 'Duracell')
          @battery_model.reload
          expect(@battery_model.name).to eq('Duracell')
        end

        it 'redirects to the updated battery_model' do
          put :update, id: @battery_model,
                       battery_model: attributes_for(:battery_model)
          expect(response).to redirect_to @battery_model
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @battery_model,
                       battery_model: attributes_for(:invalid_battery_model)
        end
        it 'locates the requested @battery_model' do
          expect(assigns(:battery_model)).to eq(@battery_model)
        end

        it "does not change @battery_model's attributes" do
          @battery_model.reload
          expect(@battery_model.name).to eq('Energizer')
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @battery_model,
          battery_model: attributes_for(:battery_model)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @battery_model = create(:battery_model)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the battery_model' do
        expect do
          delete :destroy, id: @battery_model
        end.to change(BatteryModel, :count).by(-1)
      end

      it 'redirects to battery_models#index' do
        delete :destroy, id: @battery_model
        expect(response).to redirect_to battery_models_url
      end
    end
  end
end
