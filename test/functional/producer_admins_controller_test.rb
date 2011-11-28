require 'test_helper'

class ProducerAdminsControllerTest < ActionController::TestCase
  setup do
    @producer_admin = producer_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:producer_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create producer_admin" do
    assert_difference('ProducerAdmin.count') do
      post :create, :producer_admin => @producer_admin.attributes
    end

    assert_redirected_to producer_admin_path(assigns(:producer_admin))
  end

  test "should show producer_admin" do
    get :show, :id => @producer_admin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @producer_admin.to_param
    assert_response :success
  end

  test "should update producer_admin" do
    put :update, :id => @producer_admin.to_param, :producer_admin => @producer_admin.attributes
    assert_redirected_to producer_admin_path(assigns(:producer_admin))
  end

  test "should destroy producer_admin" do
    assert_difference('ProducerAdmin.count', -1) do
      delete :destroy, :id => @producer_admin.to_param
    end

    assert_redirected_to producer_admins_path
  end
end
