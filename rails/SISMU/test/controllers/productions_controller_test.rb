require "test_helper"

class ProductionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get productions_index_url
    assert_response :success
  end

  test "should get new" do
    get productions_new_url
    assert_response :success
  end

  test "should get show" do
    get productions_show_url
    assert_response :success
  end
end
