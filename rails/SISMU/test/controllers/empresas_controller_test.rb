require "test_helper"

class EmpresasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get empresas_index_url
    assert_response :success
  end

  test "should get show" do
    get empresas_show_url
    assert_response :success
  end

  test "should get new" do
    get empresas_new_url
    assert_response :success
  end
end
