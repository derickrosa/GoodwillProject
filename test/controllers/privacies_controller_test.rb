require 'test_helper'

class PrivaciesControllerTest < ActionController::TestCase
  setup do
    @privacy = privacies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:privacies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create privacy" do
    assert_difference('Privacy.count') do
      post :create, privacy: { group_id: @privacy.group_id, request_id: @privacy.request_id }
    end

    assert_redirected_to privacy_path(assigns(:privacy))
  end

  test "should show privacy" do
    get :show, id: @privacy
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @privacy
    assert_response :success
  end

  test "should update privacy" do
    patch :update, id: @privacy, privacy: { group_id: @privacy.group_id, request_id: @privacy.request_id }
    assert_redirected_to privacy_path(assigns(:privacy))
  end

  test "should destroy privacy" do
    assert_difference('Privacy.count', -1) do
      delete :destroy, id: @privacy
    end

    assert_redirected_to privacies_path
  end
end
