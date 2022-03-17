require 'test_helper'

class CartsControllerTest < ActionDispatch::IntegrationTest

  test "should get show" do
    get carts_show_url

  test "should get update" do
    get carts_update_url

    assert_response :success
  end

end
