require 'test_helper'

class CuppingDryFragrancesControllerTest < ActionController::TestCase
  setup do
    @cupping_dry_fragrance = cupping_dry_fragrances(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_dry_fragrances)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_dry_fragrance" do
    assert_difference('CuppingDryFragrance.count') do
      post :create, :cupping_dry_fragrance => @cupping_dry_fragrance.attributes
    end

    assert_redirected_to cupping_dry_fragrance_path(assigns(:cupping_dry_fragrance))
  end

  test "should show cupping_dry_fragrance" do
    get :show, :id => @cupping_dry_fragrance.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_dry_fragrance.to_param
    assert_response :success
  end

  test "should update cupping_dry_fragrance" do
    put :update, :id => @cupping_dry_fragrance.to_param, :cupping_dry_fragrance => @cupping_dry_fragrance.attributes
    assert_redirected_to cupping_dry_fragrance_path(assigns(:cupping_dry_fragrance))
  end

  test "should destroy cupping_dry_fragrance" do
    assert_difference('CuppingDryFragrance.count', -1) do
      delete :destroy, :id => @cupping_dry_fragrance.to_param
    end

    assert_redirected_to cupping_dry_fragrances_path
  end
end
