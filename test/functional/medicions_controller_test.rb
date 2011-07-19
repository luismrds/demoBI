require 'test_helper'

class MedicionsControllerTest < ActionController::TestCase
  setup do
    @medicion = medicions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medicions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medicion" do
    assert_difference('Medicion.count') do
      post :create, :medicion => @medicion.attributes
    end

    assert_redirected_to medicion_path(assigns(:medicion))
  end

  test "should show medicion" do
    get :show, :id => @medicion.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @medicion.to_param
    assert_response :success
  end

  test "should update medicion" do
    put :update, :id => @medicion.to_param, :medicion => @medicion.attributes
    assert_redirected_to medicion_path(assigns(:medicion))
  end

  test "should destroy medicion" do
    assert_difference('Medicion.count', -1) do
      delete :destroy, :id => @medicion.to_param
    end

    assert_redirected_to medicions_path
  end
end
