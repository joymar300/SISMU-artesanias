require "test_helper"

class ClientProductosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get client_productos_index_url
    assert_response :success
  end

  test "should get new" do
    get client_productos_new_url
    assert_response :success
  end

  test "should get show" do
    get client_productos_show_url
    assert_response :success
  end

  test "should get edit" do
    get client_productos_edit_url
    assert_response :success
  end

  test "should get new" do
    get client_productos_new_url
    assert_response :success
  end

  test "should get update" do
    get client_productos_update_url
    assert_response :success
  end
end
