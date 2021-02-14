require "test_helper"

class RankedMoviesByActorTest < ActiveSupport::TestCase
  test"should return only movies with present actor" do
    assert_equal 2, RankedMoviesByActor.top_movies(actors(:natalie_portman).name).count
  end

  test "should return an empty list for unknown actor" do
    assert_empty RankedMoviesByActor.top_movies "Keanu Reeves"
  end
end