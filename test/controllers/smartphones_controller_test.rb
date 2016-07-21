require 'test_helper'

class SmartphonesControllerTest < ActionController::TestCase
  setup do
    @smartphone = smartphones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smartphones)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smartphone" do
    assert_difference('Smartphone.count') do
      post :create, smartphone: { marque: @smartphone.marque, modele: @smartphone.modele }
    end

    assert_redirected_to smartphone_path(assigns(:smartphone))
  end

  test "should show smartphone" do
    get :show, id: @smartphone
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smartphone
    assert_response :success
  end

  test "should update smartphone" do
    patch :update, id: @smartphone, smartphone: { marque: @smartphone.marque, modele: @smartphone.modele }
    assert_redirected_to smartphone_path(assigns(:smartphone))
  end

  test "should destroy smartphone" do
    assert_difference('Smartphone.count', -1) do
      delete :destroy, id: @smartphone
    end

    assert_redirected_to smartphones_path
  end
end
