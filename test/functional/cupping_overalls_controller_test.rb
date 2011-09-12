require 'test_helper'

class CuppingOverallsControllerTest < ActionController::TestCase
  setup do
    @cupping_overall = cupping_overalls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_overalls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_overall" do
    assert_difference('CuppingOverall.count') do
      post :create, :cupping_overall => @cupping_overall.attributes
    end

    assert_redirected_to cupping_overall_path(assigns(:cupping_overall))
  end

  test "should show cupping_overall" do
    get :show, :id => @cupping_overall.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_overall.to_param
    assert_response :success
  end

  test "should update cupping_overall" do
    put :update, :id => @cupping_overall.to_param, :cupping_overall => @cupping_overall.attributes
    assert_redirected_to cupping_overall_path(assigns(:cupping_overall))
  end

  test "should destroy cupping_overall" do
    assert_difference('CuppingOverall.count', -1) do
      delete :destroy, :id => @cupping_overall.to_param
    end

    assert_redirected_to cupping_overalls_path
  end
end
