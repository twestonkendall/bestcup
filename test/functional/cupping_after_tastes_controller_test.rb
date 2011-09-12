require 'test_helper'

class CuppingAfterTastesControllerTest < ActionController::TestCase
  setup do
    @cupping_after_taste = cupping_after_tastes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_after_tastes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_after_taste" do
    assert_difference('CuppingAfterTaste.count') do
      post :create, :cupping_after_taste => @cupping_after_taste.attributes
    end

    assert_redirected_to cupping_after_taste_path(assigns(:cupping_after_taste))
  end

  test "should show cupping_after_taste" do
    get :show, :id => @cupping_after_taste.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_after_taste.to_param
    assert_response :success
  end

  test "should update cupping_after_taste" do
    put :update, :id => @cupping_after_taste.to_param, :cupping_after_taste => @cupping_after_taste.attributes
    assert_redirected_to cupping_after_taste_path(assigns(:cupping_after_taste))
  end

  test "should destroy cupping_after_taste" do
    assert_difference('CuppingAfterTaste.count', -1) do
      delete :destroy, :id => @cupping_after_taste.to_param
    end

    assert_redirected_to cupping_after_tastes_path
  end
end
