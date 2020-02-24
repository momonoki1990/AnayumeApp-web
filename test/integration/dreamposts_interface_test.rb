require 'test_helper'

class DreampostsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:naoya)
  end

  test "dreampost interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    assert_select 'input[type=file]'
    assert_no_difference 'Dreampost.count' do
      post dreamposts_path, params: { dreampost: { content: "" } }
    end
    assert_select 'div#error_explanation'
    content = "ポートフォリオ作成中！"
    picture = fixture_file_upload('test/fixtures/cat1.jpg', 'images/jpg')
    assert_difference 'Dreampost.count', 1 do
      post dreamposts_path, params: { dreampost: { content: content,
                                                   picture: picture } }
    end
    assert assigns(:dreampost).picture?
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    assert_select 'a', text: '削除する'
    first_dreampost = @user.dreamposts.paginate(page: 1).first
    assert_difference 'Dreampost.count', -1 do
      delete dreampost_path(first_dreampost)      
    end
    get user_path(users(:tarou))
    assert_select 'a', text: 'delete', count: 0
  end
end