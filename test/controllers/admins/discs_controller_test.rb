require 'test_helper'

class Admins::DiscsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_discs_create_url
    assert_response :success
  end

end
