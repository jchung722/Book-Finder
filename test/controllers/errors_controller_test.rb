require "test_helper"

describe ErrorsController do
  it "should get not_found" do
    get errors_not_found_url
    value(response).must_be :success?
  end

  it "should get internal_server_error" do
    get errors_internal_server_error_url
    value(response).must_be :success?
  end

end
