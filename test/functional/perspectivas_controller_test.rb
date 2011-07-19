require 'test_helper'

class PerspectivasControllerTest < ActionController::TestCase
  setup do
    @perspectiva = perspectivas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perspectivas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create perspectiva" do
    assert_difference('Perspectiva.count') do
      post :create, :perspectiva => @perspectiva.attributes
    end

    assert_redirected_to perspectiva_path(assigns(:perspectiva))
  end

  test "should show perspectiva" do
    get :show, :id => @perspectiva.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @perspectiva.to_param
    assert_response :success
  end

  test "should update perspectiva" do
    put :update, :id => @perspectiva.to_param, :perspectiva => @perspectiva.attributes
    assert_redirected_to perspectiva_path(assigns(:perspectiva))
  end

  test "should destroy perspectiva" do
    assert_difference('Perspectiva.count', -1) do
      delete :destroy, :id => @perspectiva.to_param
    end

    assert_redirected_to perspectivas_path
  end
end
