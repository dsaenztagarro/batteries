require 'rails_helper'

describe BrandsController do
  let(:valid_attributes) { build(:brand).attributes }
  let(:invalid_attributes) { attributes_for(:invalid_brand) }

  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'assigns all battery models as @brands' do
        brand = build(:brand)
        allow(Brand).to receive(:all).and_return([brand])
        get :index
        expect(assigns(:brands)).to eq([brand])
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
        @brand = create(:brand)
        allow(Brand).to receive(:find).and_return(@brand)
        get :show, id: @brand
      end

      it 'assigns the requested battery model as @brand' do
        expect(assigns(:brand)).to eq(@brand)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:brand)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @brand a new instance' do
        get :new
        expect(assigns(:brand)).to be_a_new(Brand)
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
        it 'creates a new Brand' do
          expect do
            post :create, brand: valid_attributes
          end.to change(Brand, :count).by(1)
        end

        it 'assigns a newly created battery model as @brand' do
          post :create, brand: valid_attributes
          expect(assigns(:brand)).to be_a(Brand)
          expect(assigns(:brand)).to be_persisted
        end

        it 'redirects to the created battery model' do
          post :create, brand: valid_attributes
          expect(response).to redirect_to(Brand.last)
        end
      end

      context 'with invalid params' do
        it 'assigns a newly created but unsaved battery model' \
           'as @brand' do
          post :create, brand: invalid_attributes
          expect(assigns(:brand)).to be_a_new(Brand)
        end

        it "re-renders the 'new' template" do
          post :create, brand: invalid_attributes
          expect(response).to render_template('new')
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, brand: valid_attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @brand = create(:brand, name: 'Energizer')
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        it 'located the requested @brand' do
          put :update, id: @brand, brand: valid_attributes
          expect(assigns(:brand)).to eq(@brand)
        end

        it "changes @brand's attributes" do
          new_attributes = attributes_for(:brand, name: 'Duracell')
          put :update, id: @brand, brand: new_attributes
          @brand.reload
          expect(@brand.name).to eq('Duracell')
        end

        it 'redirects to the updated brand' do
          put :update, id: @brand,
                       brand: attributes_for(:brand)
          expect(response).to redirect_to @brand
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @brand,
                       brand: attributes_for(:invalid_brand)
        end
        it 'locates the requested @brand' do
          expect(assigns(:brand)).to eq(@brand)
        end

        it "does not change @brand's attributes" do
          @brand.reload
          expect(@brand.name).to eq('Energizer')
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @brand,
                     brand: attributes_for(:brand)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @brand = create(:brand)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the brand' do
        expect do
          delete :destroy, id: @brand
        end.to change(Brand, :count).by(-1)
      end

      it 'redirects to brands#index' do
        delete :destroy, id: @brand
        expect(response).to redirect_to brands_url
      end
    end
  end
end
