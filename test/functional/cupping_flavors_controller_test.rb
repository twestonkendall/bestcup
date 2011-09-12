require 'test_helper'

class CuppingFlavorsControllerTest < ActionController::TestCase
  setup do
    @cupping_flavor = cupping_flavors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_flavors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_flavor" do
    assert_difference('CuppingFlavor.count') do
      post :create, :cupping_flavor => @cupping_flavor.attributes
    end

    assert_redirected_to cupping_flavor_path(assigns(:cupping_flavor))
  end

  test "should show cupping_flavor" do
    get :show, :id => @cupping_flavor.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_flavor.to_param
    assert_response :success
  end

  test "should update cupping_flavor" do
    put :update, :id => @cupping_flavor.to_param, :cupping_flavor => @cupping_flavor.attributes
    assert_redirected_to cupping_flavor_path(assigns(:cupping_flavor))
  end

  test "should destroy cupping_flavor" do
    assert_difference('CuppingFlavor.count', -1) do
      delete :destroy, :id => @cupping_flavor.to_param
    end

    assert_redirected_to cupping_flavors_path
  end
end
