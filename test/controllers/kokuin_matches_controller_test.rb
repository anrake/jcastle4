require 'test_helper'

class KokuinMatchesControllerTest < ActionController::TestCase
  setup do
    @kokuin_match = kokuin_matches(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kokuin_matches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kokuin_match" do
    assert_difference('KokuinMatch.count') do
      post :create, kokuin_match: {  }
    end

    assert_redirected_to kokuin_match_path(assigns(:kokuin_match))
  end

  test "should show kokuin_match" do
    get :show, id: @kokuin_match
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @kokuin_match
    assert_response :success
  end

  test "should update kokuin_match" do
    patch :update, id: @kokuin_match, kokuin_match: {  }
    assert_redirected_to kokuin_match_path(assigns(:kokuin_match))
  end

  test "should destroy kokuin_match" do
    assert_difference('KokuinMatch.count', -1) do
      delete :destroy, id: @kokuin_match
    end

    assert_redirected_to kokuin_matches_path
  end
end
