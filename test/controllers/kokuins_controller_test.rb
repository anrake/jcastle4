require 'test_helper'

class KokuinsControllerTest < ActionController::TestCase
  setup do
    @kokuin = kokuins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kokuins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kokuin" do
    assert_difference('Kokuin.count') do
      post :create, kokuin: {  }
    end

    assert_redirected_to kokuin_path(assigns(:kokuin))
  end

  test "should show kokuin" do
    get :show, id: @kokuin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kokuin
    assert_response :success
  end

  test "should update kokuin" do
    patch :update, id: @kokuin, kokuin: {  }
    assert_redirected_to kokuin_path(assigns(:kokuin))
  end

  test "should destroy kokuin" do
    assert_difference('Kokuin.count', -1) do
      delete :destroy, id: @kokuin
    end

    assert_redirected_to kokuins_path
  end
end
