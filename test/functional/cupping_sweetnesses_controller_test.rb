require 'test_helper'

class CuppingSweetnessesControllerTest < ActionController::TestCase
  setup do
    @cupping_sweetness = cupping_sweetnesses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_sweetnesses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_sweetness" do
    assert_difference('CuppingSweetness.count') do
      post :create, :cupping_sweetness => @cupping_sweetness.attributes
    end

    assert_redirected_to cupping_sweetness_path(assigns(:cupping_sweetness))
  end

  test "should show cupping_sweetness" do
    get :show, :id => @cupping_sweetness.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_sweetness.to_param
    assert_response :success
  end

  test "should update cupping_sweetness" do
    put :update, :id => @cupping_sweetness.to_param, :cupping_sweetness => @cupping_sweetness.attributes
    assert_redirected_to cupping_sweetness_path(assigns(:cupping_sweetness))
  end

  test "should destroy cupping_sweetness" do
    assert_difference('CuppingSweetness.count', -1) do
      delete :destroy, :id => @cupping_sweetness.to_param
    end

    assert_redirected_to cupping_sweetnesses_path
  end
end
