require 'test_helper'

class RoastsControllerTest < ActionController::TestCase
  setup do
    @roast = roasts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roasts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roast" do
    assert_difference('Roast.count') do
      post :create, :roast => @roast.attributes
    end

    assert_redirected_to roast_path(assigns(:roast))
  end

  test "should show roast" do
    get :show, :id => @roast.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @roast.to_param
    assert_response :success
  end

  test "should update roast" do
    put :update, :id => @roast.to_param, :roast => @roast.attributes
    assert_redirected_to roast_path(assigns(:roast))
  end

  test "should destroy roast" do
    assert_difference('Roast.count', -1) do
      delete :destroy, :id => @roast.to_param
    end

    assert_redirected_to roasts_path
  end
end
