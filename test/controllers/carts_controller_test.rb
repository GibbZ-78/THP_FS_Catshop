require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get carts_update_url
    assert_response :success
  end

end
