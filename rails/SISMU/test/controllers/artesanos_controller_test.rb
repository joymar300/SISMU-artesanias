require "test_helper"

class ArtesanosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get artesanos_index_url
    assert_response :success
  end

  test "should get new" do
    get artesanos_new_url
    assert_response :success
  end

  test "should get show" do
    get artesanos_show_url
    assert_response :success
  end
end
