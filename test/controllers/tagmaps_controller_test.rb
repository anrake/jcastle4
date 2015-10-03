require 'test_helper'

class TagmapsControllerTest < ActionController::TestCase
  setup do
    @tagmap = tagmaps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tagmaps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tagmap" do
    assert_difference('Tagmap.count') do
      post :create, tagmap: {  }
    end

    assert_redirected_to tagmap_path(assigns(:tagmap))
  end

  test "should show tagmap" do
    get :show, id: @tagmap
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tagmap
    assert_response :success
  end

  test "should update tagmap" do
    patch :update, id: @tagmap, tagmap: {  }
    assert_redirected_to tagmap_path(assigns(:tagmap))
  end

  test "should destroy tagmap" do
    assert_difference('Tagmap.count', -1) do
      delete :destroy, id: @tagmap
    end

    assert_redirected_to tagmaps_path
  end
end
