require 'test_helper'

class CuppingTotalScoresControllerTest < ActionController::TestCase
  setup do
    @cupping_total_score = cupping_total_scores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cupping_total_scores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cupping_total_score" do
    assert_difference('CuppingTotalScore.count') do
      post :create, :cupping_total_score => @cupping_total_score.attributes
    end

    assert_redirected_to cupping_total_score_path(assigns(:cupping_total_score))
  end

  test "should show cupping_total_score" do
    get :show, :id => @cupping_total_score.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cupping_total_score.to_param
    assert_response :success
  end

  test "should update cupping_total_score" do
    put :update, :id => @cupping_total_score.to_param, :cupping_total_score => @cupping_total_score.attributes
    assert_redirected_to cupping_total_score_path(assigns(:cupping_total_score))
  end

  test "should destroy cupping_total_score" do
    assert_difference('CuppingTotalScore.count', -1) do
      delete :destroy, :id => @cupping_total_score.to_param
    end

    assert_redirected_to cupping_total_scores_path
  end
end
