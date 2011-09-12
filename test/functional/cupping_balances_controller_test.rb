require 'test_helper'

class CuppingBalancesControllerTest < ActionController::TestCase
  setup do
    @cupping_balance = cupping_balances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_balances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_balance" do
    assert_difference('CuppingBalance.count') do
      post :create, :cupping_balance => @cupping_balance.attributes
    end

    assert_redirected_to cupping_balance_path(assigns(:cupping_balance))
  end

  test "should show cupping_balance" do
    get :show, :id => @cupping_balance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_balance.to_param
    assert_response :success
  end

  test "should update cupping_balance" do
    put :update, :id => @cupping_balance.to_param, :cupping_balance => @cupping_balance.attributes
    assert_redirected_to cupping_balance_path(assigns(:cupping_balance))
  end

  test "should destroy cupping_balance" do
    assert_difference('CuppingBalance.count', -1) do
      delete :destroy, :id => @cupping_balance.to_param
    end

    assert_redirected_to cupping_balances_path
  end
end
