require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get actions" do
    get :actions
    assert_response :success
  end

end
