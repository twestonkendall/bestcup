require 'test_helper'

class CuppingCrustAromasControllerTest < ActionController::TestCase
  setup do
    @cupping_crust_aroma = cupping_crust_aromas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_crust_aromas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_crust_aroma" do
    assert_difference('CuppingCrustAroma.count') do
      post :create, :cupping_crust_aroma => @cupping_crust_aroma.attributes
    end

    assert_redirected_to cupping_crust_aroma_path(assigns(:cupping_crust_aroma))
  end

  test "should show cupping_crust_aroma" do
    get :show, :id => @cupping_crust_aroma.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_crust_aroma.to_param
    assert_response :success
  end

  test "should update cupping_crust_aroma" do
    put :update, :id => @cupping_crust_aroma.to_param, :cupping_crust_aroma => @cupping_crust_aroma.attributes
    assert_redirected_to cupping_crust_aroma_path(assigns(:cupping_crust_aroma))
  end

  test "should destroy cupping_crust_aroma" do
    assert_difference('CuppingCrustAroma.count', -1) do
      delete :destroy, :id => @cupping_crust_aroma.to_param
    end

    assert_redirected_to cupping_crust_aromas_path
  end
end
