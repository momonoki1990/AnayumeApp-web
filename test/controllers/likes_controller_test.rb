# frozen_string_literal: true

require 'test_helper'
__END__
class LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get likes_index_url
    assert_response :success
  end
end
