require 'test_helper'

class Admins::LabelsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_labels_create_url
    assert_response :success
  end

end
