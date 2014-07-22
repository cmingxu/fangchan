require 'test_helper'

class Restricted::ApplicationControllerTest < ActionController::TestCase
  test "should get settings" do
    get :settings
    assert_response :success
  end

end
