require 'test_helper'

class BatteryModelsControllerTest < ActionController::TestCase
  setup do
    @battery_model = battery_models(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battery_models)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battery_model" do
    assert_difference('BatteryModel.count') do
      post :create, battery_model: {  }
    end

    assert_redirected_to battery_model_path(assigns(:battery_model))
  end

  test "should show battery_model" do
    get :show, id: @battery_model
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battery_model
    assert_response :success
  end

  test "should update battery_model" do
    patch :update, id: @battery_model, battery_model: {  }
    assert_redirected_to battery_model_path(assigns(:battery_model))
  end

  test "should destroy battery_model" do
    assert_difference('BatteryModel.count', -1) do
      delete :destroy, id: @battery_model
    end

    assert_redirected_to battery_models_path
  end
end
