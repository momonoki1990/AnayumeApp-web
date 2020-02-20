# frozen_string_literal: true

require 'test_helper'

class DreampostTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:naoya)
    @dreampost = @user.dreamposts.build(content: "Lorem ipsum", user_id: @user.id)
  end

  test "should be valid" do
    assert @dreampost.valid?
  end

  test "user id should be present" do
    @dreampost.user_id = nil
    assert_not @dreampost.valid?
  end

  test "content should be present" do
    @dreampost.content = "  "
    assert_not @dreampost.valid?
  end

  test "order should be most recent first" do
    assert_equal dreamposts(:most_recent), Dreampost.first
  end

end
