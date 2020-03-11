require 'test_helper'

class ReplyInterfaceTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:naoya)
    @dreampost = dreamposts(:business)
    log_in_as(@user)
  end

  test "reply interface" do
    get root_path
    assert_select 'span[class=reply]'
    content = "返信テストです。"
    in_reply_to = @dreampost.id
    post dreamposts_path, params: { dreampost: { content: content,
                                                 in_reply_to: in_reply_to } }
    assert_equal in_reply_to, assigns(:dreampost).in_reply_to
  end
end
