require 'test_helper'

class Admins::EndusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_endusers_index_url
    assert_response :success
  end

end
