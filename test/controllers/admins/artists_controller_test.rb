require 'test_helper'

class Admins::ArtistsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get admins_artists_create_url
    assert_response :success
  end

end
