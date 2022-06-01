require "test_helper"

class Productions::DproductionsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get productions_dproductions_create_url
    assert_response :success
  end

  test "should get index" do
    get productions_dproductions_index_url
    assert_response :success
  end
end
