require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest
  test "controller returns successfully without parameters" do
    get "/"
    assert_response :success
    assert_match 'Star Wars', @response.body
    assert_match 'hackers', @response.body
  end

  test "blah" do
    get "/", params: { query: 'Nat' }
    assert_match 'Star Wars', @response.body
    assert_no_match 'hackers', @response.body
  end
end
