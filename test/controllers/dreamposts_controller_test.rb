# frozen_string_literal: true

require 'test_helper'

class DreampostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @dreampost = dreamposts(:engineer)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Dreampost.count' do
      post dreamposts_path, params: { dreampost: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'Dreampost.count' do
      delete dreampost_path(@dreampost)
    end
    assert_redirected_to maps_url
  end

  test "should redirect destroy for wrong dreampost" do
    log_in_as(users(:naoya))
    dreampost = dreamposts(:big)
    assert_no_difference 'Dreampost.count' do
      delete dreampost_path(dreampost)
    end
    assert_redirected_to maps_url
  end
end
