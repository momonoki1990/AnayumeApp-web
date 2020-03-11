require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout_links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", signup_path
  end
end
