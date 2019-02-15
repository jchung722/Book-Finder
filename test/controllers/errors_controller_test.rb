require "test_helper"

describe ErrorsController do
  it "should get not_found" do
    get "/404"
    value(response).must_be :missing?
  end

  it "should get internal_server_error" do
    get "/500"
    value(response).must_be :error?
  end

end
