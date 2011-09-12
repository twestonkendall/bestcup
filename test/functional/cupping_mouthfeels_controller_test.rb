require 'test_helper'

class CuppingMouthfeelsControllerTest < ActionController::TestCase
  setup do
    @cupping_mouthfeel = cupping_mouthfeels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_mouthfeels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_mouthfeel" do
    assert_difference('CuppingMouthfeel.count') do
      post :create, :cupping_mouthfeel => @cupping_mouthfeel.attributes
    end

    assert_redirected_to cupping_mouthfeel_path(assigns(:cupping_mouthfeel))
  end

  test "should show cupping_mouthfeel" do
    get :show, :id => @cupping_mouthfeel.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_mouthfeel.to_param
    assert_response :success
  end

  test "should update cupping_mouthfeel" do
    put :update, :id => @cupping_mouthfeel.to_param, :cupping_mouthfeel => @cupping_mouthfeel.attributes
    assert_redirected_to cupping_mouthfeel_path(assigns(:cupping_mouthfeel))
  end

  test "should destroy cupping_mouthfeel" do
    assert_difference('CuppingMouthfeel.count', -1) do
      delete :destroy, :id => @cupping_mouthfeel.to_param
    end

    assert_redirected_to cupping_mouthfeels_path
  end
end
