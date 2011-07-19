require 'test_helper'

class IndicadorsControllerTest < ActionController::TestCase
  setup do
    @indicador = indicadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:indicadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create indicador" do
    assert_difference('Indicador.count') do
      post :create, :indicador => @indicador.attributes
    end

    assert_redirected_to indicador_path(assigns(:indicador))
  end

  test "should show indicador" do
    get :show, :id => @indicador.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @indicador.to_param
    assert_response :success
  end

  test "should update indicador" do
    put :update, :id => @indicador.to_param, :indicador => @indicador.attributes
    assert_redirected_to indicador_path(assigns(:indicador))
  end

  test "should destroy indicador" do
    assert_difference('Indicador.count', -1) do
      delete :destroy, :id => @indicador.to_param
    end

    assert_redirected_to indicadors_path
  end
end
