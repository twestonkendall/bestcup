require 'test_helper'

class CuppingAciditiesControllerTest < ActionController::TestCase
  setup do
    @cupping_acidity = cupping_acidities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_acidities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_acidity" do
    assert_difference('CuppingAcidity.count') do
      post :create, :cupping_acidity => @cupping_acidity.attributes
    end

    assert_redirected_to cupping_acidity_path(assigns(:cupping_acidity))
  end

  test "should show cupping_acidity" do
    get :show, :id => @cupping_acidity.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_acidity.to_param
    assert_response :success
  end

  test "should update cupping_acidity" do
    put :update, :id => @cupping_acidity.to_param, :cupping_acidity => @cupping_acidity.attributes
    assert_redirected_to cupping_acidity_path(assigns(:cupping_acidity))
  end

  test "should destroy cupping_acidity" do
    assert_difference('CuppingAcidity.count', -1) do
      delete :destroy, :id => @cupping_acidity.to_param
    end

    assert_redirected_to cupping_acidities_path
  end
end
