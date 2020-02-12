require 'test_helper'

class DreamsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dreams_show_url
    assert_response :success
  end

end
