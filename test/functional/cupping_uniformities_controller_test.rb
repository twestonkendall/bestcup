require 'test_helper'

class CuppingUniformitiesControllerTest < ActionController::TestCase
  setup do
    @cupping_uniformity = cupping_uniformities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_uniformities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_uniformity" do
    assert_difference('CuppingUniformity.count') do
      post :create, :cupping_uniformity => @cupping_uniformity.attributes
    end

    assert_redirected_to cupping_uniformity_path(assigns(:cupping_uniformity))
  end

  test "should show cupping_uniformity" do
    get :show, :id => @cupping_uniformity.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_uniformity.to_param
    assert_response :success
  end

  test "should update cupping_uniformity" do
    put :update, :id => @cupping_uniformity.to_param, :cupping_uniformity => @cupping_uniformity.attributes
    assert_redirected_to cupping_uniformity_path(assigns(:cupping_uniformity))
  end

  test "should destroy cupping_uniformity" do
    assert_difference('CuppingUniformity.count', -1) do
      delete :destroy, :id => @cupping_uniformity.to_param
    end

    assert_redirected_to cupping_uniformities_path
  end
end
