require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get index/homepage" do
    get "/"
    assert_response :success
  end

  test "should properly render with search results" do
    VCR.use_cassette("books") do
      google_books_data = BooksApiWrapper.new(GoogleBooks)
      @data = google_books_data.search("harry", "")

      get "/"
      assert_response :success
    end
  end

  test "going to wrong homepage will raise error" do
    assert_raises ActionController::RoutingError do
      get "/home"
    end
  end


end
