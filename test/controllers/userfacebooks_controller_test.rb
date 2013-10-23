require 'test_helper'

class UserfacebooksControllerTest < ActionController::TestCase
  setup do
    @userfacebook = userfacebooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:userfacebooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create userfacebook" do
    assert_difference('Userfacebook.count') do
      post :create, userfacebook: { email: @userfacebook.email, name: @userfacebook.name }
    end

    assert_redirected_to userfacebook_path(assigns(:userfacebook))
  end

  test "should show userfacebook" do
    get :show, id: @userfacebook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @userfacebook
    assert_response :success
  end

  test "should update userfacebook" do
    patch :update, id: @userfacebook, userfacebook: { email: @userfacebook.email, name: @userfacebook.name }
    assert_redirected_to userfacebook_path(assigns(:userfacebook))
  end

  test "should destroy userfacebook" do
    assert_difference('Userfacebook.count', -1) do
      delete :destroy, id: @userfacebook
    end

    assert_redirected_to userfacebooks_path
  end
end
