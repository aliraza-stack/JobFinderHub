require "test_helper"

class LaborsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get labors_dashboard_url
    assert_response :success
  end
end
