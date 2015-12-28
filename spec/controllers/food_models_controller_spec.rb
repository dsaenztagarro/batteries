require 'rails_helper'

describe FoodModelsController do
  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'populates an array of food models' do
        food_model = build(:food_model)
        allow(FoodModel).to receive(:all).and_return([food_model])
        get :index
        expect(assigns(:food_models)).to eq([food_model])
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
        @food_model = create(:food_model)
        allow(FoodModel).to receive(:find).and_return(@food_model)
        get :show, id: @food_model
      end

      it 'assigns the requested battery size to @food_model' do
        expect(assigns(:food_model)).to eq(@food_model)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:food_model)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @food_model a new instance' do
        get :new
        expect(assigns(:food_model)).to be_a_new(FoodModel)
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
        post :create, food_model: build(:food_model).attributes
      end

      it 'redirects to battery size show page' do
        expect(response).to redirect_to(food_model_path(FoodModel.last))
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, food_model: build(:food_model).attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    before :each do
      @food_model = create(:food_model, name: 'AA')
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        it 'located the requested @food_model' do
          put :update, id: @food_model, food_model: attributes_for(:food_model)
          expect(assigns(:food_model)).to eq(@food_model)
        end

        it "changes @food_model's attributes" do
          put :update, id: @food_model,
                       food_model: attributes_for(:food_model, name: 'AAA')
          @food_model.reload
          expect(@food_model.name).to eq('AAA')
        end

        it 'redirects to the updated food_model' do
          put :update, id: @food_model,
                       food_model: attributes_for(:food_model)
          expect(response).to redirect_to @food_model
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @food_model,
                       food_model: attributes_for(:invalid_food_model)
        end
        it 'locates the requested @food_model' do
          expect(assigns(:food_model)).to eq(@food_model)
        end

        it "does not change @food_model's attributes" do
          @food_model.reload
          expect(@food_model.name).to eq('AA')
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @food_model,
                     food_model: attributes_for(:food_model)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @food_model = create(:food_model)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the food_model' do
        expect do
          delete :destroy, id: @food_model
        end.to change(FoodModel, :count).by(-1)
      end

      it 'redirects to food_models#index' do
        delete :destroy, id: @food_model
        expect(response).to redirect_to food_models_url
      end
    end
  end
end
