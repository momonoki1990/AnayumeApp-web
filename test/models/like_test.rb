# frozen_string_literal: true

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(user_id: users(:naoya).id,
                     dreampost_id: dreamposts(:cafe).id)
  end

  test "should be valid" do
    assert @like.valid?
  end

  test "should require a user_id" do
    @like.user_id = nil
    assert_not @like.valid?
  end

  test "should require a dreampost_id" do
    @like.dreampost_id = nil
    assert_not @like.valid?
  end
end
