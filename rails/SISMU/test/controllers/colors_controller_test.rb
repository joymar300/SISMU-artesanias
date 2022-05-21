require "test_helper"

class ColorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get colors_index_url
    assert_response :success
  end

  test "should get new" do
    get colors_new_url
    assert_response :success
  end

  test "should get create" do
    get colors_create_url
    assert_response :success
  end

  test "should get show" do
    get colors_show_url
    assert_response :success
  end
end
