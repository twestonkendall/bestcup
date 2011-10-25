require 'test_helper'

class RoastersControllerTest < ActionController::TestCase
  setup do
    @roaster = roasters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roasters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roaster" do
    assert_difference('Roaster.count') do
      post :create, :roaster => @roaster.attributes
    end

    assert_redirected_to roaster_path(assigns(:roaster))
  end

  test "should show roaster" do
    get :show, :id => @roaster.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @roaster.to_param
    assert_response :success
  end

  test "should update roaster" do
    put :update, :id => @roaster.to_param, :roaster => @roaster.attributes
    assert_redirected_to roaster_path(assigns(:roaster))
  end

  test "should destroy roaster" do
    assert_difference('Roaster.count', -1) do
      delete :destroy, :id => @roaster.to_param
    end

    assert_redirected_to roasters_path
  end
end
