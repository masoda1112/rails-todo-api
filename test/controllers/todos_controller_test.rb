require "test_helper"

class TodosControllerTest < ActionDispatch::IntegrationTest
  test "should get get" do
    get todos_get_url
    assert_response :success
  end
end
