require 'test_helper'

class CuppingBreakAromasControllerTest < ActionController::TestCase
  setup do
    @cupping_break_aroma = cupping_break_aromas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_break_aromas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_break_aroma" do
    assert_difference('CuppingBreakAroma.count') do
      post :create, :cupping_break_aroma => @cupping_break_aroma.attributes
    end

    assert_redirected_to cupping_break_aroma_path(assigns(:cupping_break_aroma))
  end

  test "should show cupping_break_aroma" do
    get :show, :id => @cupping_break_aroma.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_break_aroma.to_param
    assert_response :success
  end

  test "should update cupping_break_aroma" do
    put :update, :id => @cupping_break_aroma.to_param, :cupping_break_aroma => @cupping_break_aroma.attributes
    assert_redirected_to cupping_break_aroma_path(assigns(:cupping_break_aroma))
  end

  test "should destroy cupping_break_aroma" do
    assert_difference('CuppingBreakAroma.count', -1) do
      delete :destroy, :id => @cupping_break_aroma.to_param
    end

    assert_redirected_to cupping_break_aromas_path
  end
end
