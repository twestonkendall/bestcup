require 'test_helper'

class RoasteryAdminsControllerTest < ActionController::TestCase
  setup do
    @roastery_admin = roastery_admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:roastery_admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create roastery_admin" do
    assert_difference('RoasteryAdmin.count') do
      post :create, :roastery_admin => @roastery_admin.attributes
    end

    assert_redirected_to roastery_admin_path(assigns(:roastery_admin))
  end

  test "should show roastery_admin" do
    get :show, :id => @roastery_admin.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @roastery_admin.to_param
    assert_response :success
  end

  test "should update roastery_admin" do
    put :update, :id => @roastery_admin.to_param, :roastery_admin => @roastery_admin.attributes
    assert_redirected_to roastery_admin_path(assigns(:roastery_admin))
  end

  test "should destroy roastery_admin" do
    assert_difference('RoasteryAdmin.count', -1) do
      delete :destroy, :id => @roastery_admin.to_param
    end

    assert_redirected_to roastery_admins_path
  end
end
