require "test_helper"

class EmfacturasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get emfacturas_index_url
    assert_response :success
  end

  test "should get show" do
    get emfacturas_show_url
    assert_response :success
  end

  test "should get new" do
    get emfacturas_new_url
    assert_response :success
  end
end
