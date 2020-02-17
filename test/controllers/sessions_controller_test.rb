# frozen_string_literal: true

require 'test_helper'
__END__
class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get login_path
    assert_response :success
  end
end
