require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index/homepage" do
    get "/"
    assert_response :success
  end
end
