require 'rails_helper'

describe FoodsController do
  let(:valid_attributes) { build(:food).attributes }
  let(:invalid_attributes) { valid_attributes.merge(food_model_id: 0) }

  describe 'GET #index' do
    context 'when user is logged in' do
      login_user

      it 'populates an array of food models' do
        food = build(:food)
        allow(Food).to receive(:all).and_return([food])
        get :index
        expect(assigns(:foods)).to eq([food])
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
        @food = create(:food)
        allow(Food).to receive(:find).and_return(@food)
        get :show, id: @food
      end

      it 'assigns the requested battery size to @food' do
        expect(assigns(:food)).to eq(@food)
      end

      it 'renders the #show view' do
        expect(response).to render_template :show
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        get :show, id: create(:food)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'GET #new' do
    context 'when user is logged in' do
      login_user

      it 'assigns @food a new instance' do
        get :new
        expect(assigns(:food)).to be_a_new(Food)
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
        post :create, food: build(:food).attributes
      end

      it 'redirects to battery size show page' do
        expect(response).to redirect_to(food_path(Food.last))
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        post :create, food: build(:food).attributes
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'PUT #update' do
    let(:new_food_model) { create(:food_model) }

    before :each do
      @food_model = create(:food_model)
      @food = create(:food, food_model: @food_model)
    end

    context 'when user is logged in' do
      login_user

      context 'valid attributes' do
        it 'located the requested @food' do
          put :update, id: @food, food: valid_attributes
          expect(assigns(:food)).to eq(@food)
        end

        it "changes @food's attributes" do
          put :update, id: @food,
                       food: attributes_for(:food, food_model_id: new_food_model.id)
          @food.reload
          expect(@food.food_model).to eq(new_food_model)
        end

        it 'redirects to the updated food' do
          put :update, id: @food, food: valid_attributes
          expect(response).to redirect_to @food
        end
      end

      context 'invalid attributes' do
        before :each do
          put :update, id: @food, food: invalid_attributes
        end
        it 'locates the requested @food' do
          expect(assigns(:food)).to eq(@food)
        end

        it "does not change @food's attributes" do
          @food.reload
          expect(@food.food_model).to eq(@food_model)
        end

        it 're-renders the edit method' do
          expect(response).to render_template :edit
        end
      end
    end

    context 'when user is logged out' do
      it 'redirects to login page' do
        put :update, id: @food,
                     food: attributes_for(:food)
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @food = create(:food)
    end

    context 'when user is logged in' do
      login_user

      it 'deletes the food' do
        expect do
          delete :destroy, id: @food
        end.to change(Food, :count).by(-1)
      end

      it 'redirects to foods#index' do
        delete :destroy, id: @food
        expect(response).to redirect_to foods_url
      end
    end
  end
end
