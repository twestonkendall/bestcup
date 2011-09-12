require 'test_helper'

class BlendsControllerTest < ActionController::TestCase
  setup do
    @blend = blends(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:blends)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create blend" do
    assert_difference('Blend.count') do
      post :create, :blend => @blend.attributes
    end

    assert_redirected_to blend_path(assigns(:blend))
  end

  test "should show blend" do
    get :show, :id => @blend.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @blend.to_param
    assert_response :success
  end

  test "should update blend" do
    put :update, :id => @blend.to_param, :blend => @blend.attributes
    assert_redirected_to blend_path(assigns(:blend))
  end

  test "should destroy blend" do
    assert_difference('Blend.count', -1) do
      delete :destroy, :id => @blend.to_param
    end

    assert_redirected_to blends_path
  end
end
