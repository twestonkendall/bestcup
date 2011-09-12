require 'test_helper'

class CuppingsControllerTest < ActionController::TestCase
  setup do
    @cupping = cuppings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cuppings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping" do
    assert_difference('Cupping.count') do
      post :create, :cupping => @cupping.attributes
    end

    assert_redirected_to cupping_path(assigns(:cupping))
  end

  test "should show cupping" do
    get :show, :id => @cupping.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping.to_param
    assert_response :success
  end

  test "should update cupping" do
    put :update, :id => @cupping.to_param, :cupping => @cupping.attributes
    assert_redirected_to cupping_path(assigns(:cupping))
  end

  test "should destroy cupping" do
    assert_difference('Cupping.count', -1) do
      delete :destroy, :id => @cupping.to_param
    end

    assert_redirected_to cuppings_path
  end
end
