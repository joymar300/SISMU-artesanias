require "test_helper"

class ProductoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get producto_index_url
    assert_response :success
  end

  test "should get show" do
    get producto_show_url
    assert_response :success
  end

  test "should get edit" do
    get producto_edit_url
    assert_response :success
  end

  test "should get new" do
    get producto_new_url
    assert_response :success
  end

  test "should get update" do
    get producto_update_url
    assert_response :success
  end
end
