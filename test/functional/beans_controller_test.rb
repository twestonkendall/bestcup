require 'test_helper'

class BeansControllerTest < ActionController::TestCase
  setup do
    @bean = beans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:beans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bean" do
    assert_difference('Bean.count') do
      post :create, :bean => @bean.attributes
    end

    assert_redirected_to bean_path(assigns(:bean))
  end

  test "should show bean" do
    get :show, :id => @bean.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @bean.to_param
    assert_response :success
  end

  test "should update bean" do
    put :update, :id => @bean.to_param, :bean => @bean.attributes
    assert_redirected_to bean_path(assigns(:bean))
  end

  test "should destroy bean" do
    assert_difference('Bean.count', -1) do
      delete :destroy, :id => @bean.to_param
    end

    assert_redirected_to beans_path
  end
end
