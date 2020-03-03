require 'test_helper'

class LikeUnlikeTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:naoya)
    @dreampost = dreamposts(:business)
    @other_dreampost = dreamposts(:cafe)
    log_in_as(@user)
  end

  test "likes interface" do    
    get root_path    
    assert_not @dreampost.likes.empty?
    assert_match @dreampost.likes.count.to_s, response.body
    delete like_path(likes(:one))
    assert @dreampost.likes.empty?
    assert_redirected_to root_url
    follow_redirect!
    assert_match @dreampost.likes.count.to_s, response.body
  end

  test "should like a dreampost the standard way" do
    assert_difference '@other_dreampost.likes.count', 1 do
      post likes_path, params: { dreampost_id: @other_dreampost.id }
    end
  end

  test "should like a dreampost with Ajax" do
    assert_difference '@other_dreampost.likes.count', 1 do
      post likes_path, xhr: true, params: { dreampost_id: @other_dreampost.id }      
    end
  end

  test "should unlike a dreampost the standard way" do
    likes = @user.likes.find_by(dreampost_id: @dreampost.id)
    assert_difference '@dreampost.likes.count', -1 do
      delete like_path(likes)
    end
  end

  test "should unlike a dreampost the standard way with Ajax" do
    likes = @user.likes.find_by(dreampost_id: @dreampost.id)
    assert_difference '@dreampost.likes.count', -1 do
      delete like_path(likes), xhr: true
    end
  end
end
