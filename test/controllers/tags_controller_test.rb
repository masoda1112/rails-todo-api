require "test_helper"

class TagsControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get tags_get_url
    assert_response :success
  end
end
