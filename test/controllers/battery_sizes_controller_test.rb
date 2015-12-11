require 'test_helper'

class BatterySizesControllerTest < ActionController::TestCase
  setup do
    @battery_size = battery_sizes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:battery_sizes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create battery_size" do
    assert_difference('BatterySize.count') do
      post :create, battery_size: {  }
    end

    assert_redirected_to battery_size_path(assigns(:battery_size))
  end

  test "should show battery_size" do
    get :show, id: @battery_size
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @battery_size
    assert_response :success
  end

  test "should update battery_size" do
    patch :update, id: @battery_size, battery_size: {  }
    assert_redirected_to battery_size_path(assigns(:battery_size))
  end

  test "should destroy battery_size" do
    assert_difference('BatterySize.count', -1) do
      delete :destroy, id: @battery_size
    end

    assert_redirected_to battery_sizes_path
  end
end
