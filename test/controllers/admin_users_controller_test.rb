require 'test_helper'

class AdminUsersControllerTest < ActionController::TestCase
  setup do
    @admin = admins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:admins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create admin" do
    assert_difference('AdminUser.count') do
      post :create, admin: { name: @admin.name, password_hash: @admin.password_hash, password_salt: @admin.password_salt, persistence_token: @admin.persistence_token, username: @admin.username }
    end

    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should show admin" do
    get :show, id: @admin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @admin
    assert_response :success
  end

  test "should update admin" do
    patch :update, id: @admin, admin: { name: @admin.name, password_hash: @admin.password_hash, password_salt: @admin.password_salt, persistence_token: @admin.persistence_token, username: @admin.username }
    assert_redirected_to admin_path(assigns(:admin))
  end

  test "should destroy admin" do
    assert_difference('AdminUser.count', -1) do
      delete :destroy, id: @admin
    end

    assert_redirected_to admins_path
  end
end
