require 'test_helper'

class MapsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:naoya)
    @other_user = users(:tarou)
  end

  test "should redirect index when not logged in" do
    get maps_path(@user)
    assert_not flash.empty?
    assert_redirected_to login_url
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'Map.count' do
      post maps_path, params: { map: { address: "東京", latitude: "35.681", longitude: "139.767", title: "東京" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect index when logged in as wrong user" do
    log_in_as(@other_user)
    get maps_path(@user)
    assert flash.empty?
    assert_redirected_to root_url
  end

  test "should redirect destroy for wrong map" do
    log_in_as(@other)
    map = maps(:egypt)
    assert_no_difference 'Map.count' do
      delete map_path(map)
    end
    assert_redirected_to root_url
  end
end
