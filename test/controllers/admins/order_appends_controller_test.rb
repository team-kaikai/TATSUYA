require 'test_helper'

class Admins::OrderAppendsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admins_order_appends_show_url
    assert_response :success
  end

  test "should get index" do
    get admins_order_appends_index_url
    assert_response :success
  end

end
