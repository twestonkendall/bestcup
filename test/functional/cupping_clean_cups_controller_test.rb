require 'test_helper'

class CuppingCleanCupsControllerTest < ActionController::TestCase
  setup do
    @cupping_clean_cup = cupping_clean_cups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_clean_cups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_clean_cup" do
    assert_difference('CuppingCleanCup.count') do
      post :create, :cupping_clean_cup => @cupping_clean_cup.attributes
    end

    assert_redirected_to cupping_clean_cup_path(assigns(:cupping_clean_cup))
  end

  test "should show cupping_clean_cup" do
    get :show, :id => @cupping_clean_cup.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_clean_cup.to_param
    assert_response :success
  end

  test "should update cupping_clean_cup" do
    put :update, :id => @cupping_clean_cup.to_param, :cupping_clean_cup => @cupping_clean_cup.attributes
    assert_redirected_to cupping_clean_cup_path(assigns(:cupping_clean_cup))
  end

  test "should destroy cupping_clean_cup" do
    assert_difference('CuppingCleanCup.count', -1) do
      delete :destroy, :id => @cupping_clean_cup.to_param
    end

    assert_redirected_to cupping_clean_cups_path
  end
end
