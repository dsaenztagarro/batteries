require 'rails_helper'

describe BatteryPacksController do
  let(:valid_attributes) { build(:battery_pack).attributes }
  let(:invalid_attributes) { valid_attributes.merge(battery_pack_model_id: 0) }

  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'populates an array of battery sizes' do
        battery_pack = build(:battery_pack)
        allow(BatteryPack).to receive(:all).and_return([battery_pack])
        get :index
        expect(assigns(:battery_packs)).to eq([battery_pack])
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
        @battery_pack = create(:battery_pack)
        allow(BatteryPack).to receive(:find).and_return(@battery_pack)
        get :show, id: @battery_pack
      end

      it 'assigns the requested battery size to @battery_pack' do
        expect(assigns(:battery_pack)).to eq(@battery_pack)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:battery_pack)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @battery_pack a new instance' do
        get :new
        expect(assigns(:battery_pack)).to be_a_new(BatteryPack)
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
        post :create, battery_pack: build(:battery_pack).attributes
      end

      it 'redirects to battery size show page' do
        expect(response).to redirect_to(battery_pack_path(BatteryPack.last))
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, battery_pack: build(:battery_pack).attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    let(:old_model) { create(:battery_pack_model) }
    let(:new_model) { create(:battery_pack_model) }

    before :each do
      @battery_pack = create(:battery_pack, battery_pack_model: old_model)
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        let(:new_attributes) do
          valid_attributes.merge(battery_pack_model_id: new_model.id)
        end

        it 'located the requested @battery_pack' do
          put :update, id: @battery_pack, battery_pack: new_attributes
          expect(assigns(:battery_pack)).to eq(@battery_pack)
        end

        it "changes @battery_pack's attributes" do
          put :update, id: @battery_pack, battery_pack: new_attributes
          @battery_pack.reload
          expect(@battery_pack.battery_pack_model).to eq(new_model)
        end

        it 'redirects to the updated battery_pack' do
          put :update, id: @battery_pack, battery_pack: new_attributes
          expect(response).to redirect_to @battery_pack
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @battery_pack, battery_pack: invalid_attributes
        end
        it 'locates the requested @battery_pack' do
          expect(assigns(:battery_pack)).to eq(@battery_pack)
        end

        it "does not change @battery_pack's attributes" do
          @battery_pack.reload
          expect(@battery_pack.battery_pack_model).to eq(old_model)
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @battery_pack, battery_pack: valid_attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @battery_pack = create(:battery_pack)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the battery_pack' do
        expect do
          delete :destroy, id: @battery_pack
        end.to change(BatteryPack, :count).by(-1)
      end

      it 'redirects to battery_packs#index' do
        delete :destroy, id: @battery_pack
        expect(response).to redirect_to battery_packs_url
      end
    end
  end
end
