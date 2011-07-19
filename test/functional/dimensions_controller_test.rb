require 'test_helper'

class DimensionsControllerTest < ActionController::TestCase
  setup do
    @dimension = dimensions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dimensions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dimension" do
    assert_difference('Dimension.count') do
      post :create, :dimension => @dimension.attributes
    end

    assert_redirected_to dimension_path(assigns(:dimension))
  end

  test "should show dimension" do
    get :show, :id => @dimension.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @dimension.to_param
    assert_response :success
  end

  test "should update dimension" do
    put :update, :id => @dimension.to_param, :dimension => @dimension.attributes
    assert_redirected_to dimension_path(assigns(:dimension))
  end

  test "should destroy dimension" do
    assert_difference('Dimension.count', -1) do
      delete :destroy, :id => @dimension.to_param
    end

    assert_redirected_to dimensions_path
  end
end
