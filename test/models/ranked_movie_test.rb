require "test_helper"

class RankedMovieTest < ActiveSupport::TestCase
  test "should have top rated movie on top" do
    movie = RankedMovie.top_movies.first

    assert_equal movies(:hackers), movie
  end

  test "should return all available movies" do
    assert_equal 3, RankedMovie.top_movies.count
  end
end