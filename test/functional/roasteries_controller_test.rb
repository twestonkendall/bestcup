require 'test_helper'

class RoasteriesControllerTest < ActionController::TestCase
  setup do
    @roastery = roasteries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roasteries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roastery" do
    assert_difference('Roastery.count') do
      post :create, :roastery => @roastery.attributes
    end

    assert_redirected_to roastery_path(assigns(:roastery))
  end

  test "should show roastery" do
    get :show, :id => @roastery.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @roastery.to_param
    assert_response :success
  end

  test "should update roastery" do
    put :update, :id => @roastery.to_param, :roastery => @roastery.attributes
    assert_redirected_to roastery_path(assigns(:roastery))
  end

  test "should destroy roastery" do
    assert_difference('Roastery.count', -1) do
      delete :destroy, :id => @roastery.to_param
    end

    assert_redirected_to roasteries_path
  end
end
