require 'test_helper'

class SearchInterfaceTest < ActionDispatch::IntegrationTest
  test "search interface" do
    search = "エンジニア"
    no_search = "カフェ"
    get search_path, params: { dreampost: { search: search } }
    assert_template 'static_pages/home'
    assert_match search, response.body
    assert_no_match no_search, response.body
  end
end
