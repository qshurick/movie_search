class MoviesController < ApplicationController
  def index
    @query = params[:query]
    if @query
      @movies = RankedMoviesByActor.top_movies @query
    else
      @movies = RankedMovie.top_movies
    end
  end
end
