require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index/homepage" do
    get "/"
    assert_response :success
    assert_template :index
  end

  test "navigating to other page will result in error" do
    get "/home"
    refute_response :success
  end
end
