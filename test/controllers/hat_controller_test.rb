require 'test_helper'

class HatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get hat_index_url
    assert_response :success
  end

end
