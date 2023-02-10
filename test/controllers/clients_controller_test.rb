require "test_helper"

class ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get clients_dashboard_url
    assert_response :success
  end
end
