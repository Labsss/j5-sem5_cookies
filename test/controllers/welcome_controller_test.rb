require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get first_name" do
    get welcome_first_name_url
    assert_response :success
  end

end
