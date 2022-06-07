require "test_helper"

class Emfacturas::EmdetallesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get emfacturas_emdetalles_create_url
    assert_response :success
  end
end
