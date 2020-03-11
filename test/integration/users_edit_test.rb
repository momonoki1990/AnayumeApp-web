require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:naoya)
  end

  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), params: { user: { name: "",
                                              email: "foo@invalid",
                                              password: "foo",
                                              password_confirmation: "bar" } }
    assert_template 'users/edit'
  end

  test "successful edit with friendly forwarding" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_url(@user)
    name = "Kenta Kondou"
    email = "kenta@example.com"
    picture = fixture_file_upload('test/fixtures/cat1.jpg', 'images/jpg')
    patch user_path(@user), params: { user: { name: name,
                                              email: email,
                                              password: "",
                                              password_confirmation: "",
                                              picture: picture } }
    assert_not flash.empty?
    assert_redirected_to @user
    assert assigns(:user).picture?
    @user.reload
    assert_equal name, @user.name
    assert_equal email, @user.email
  end
end
