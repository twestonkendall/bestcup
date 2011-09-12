require 'test_helper'

class CuppingDefectsControllerTest < ActionController::TestCase
  setup do
    @cupping_defect = cupping_defects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_defects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_defect" do
    assert_difference('CuppingDefect.count') do
      post :create, :cupping_defect => @cupping_defect.attributes
    end

    assert_redirected_to cupping_defect_path(assigns(:cupping_defect))
  end

  test "should show cupping_defect" do
    get :show, :id => @cupping_defect.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_defect.to_param
    assert_response :success
  end

  test "should update cupping_defect" do
    put :update, :id => @cupping_defect.to_param, :cupping_defect => @cupping_defect.attributes
    assert_redirected_to cupping_defect_path(assigns(:cupping_defect))
  end

  test "should destroy cupping_defect" do
    assert_difference('CuppingDefect.count', -1) do
      delete :destroy, :id => @cupping_defect.to_param
    end

    assert_redirected_to cupping_defects_path
  end
end
