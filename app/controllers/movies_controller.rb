class MoviesController < ApplicationController
  def index
    @query = params[:query]
    @movies = @query ? Movie.by_actor(@query) : Movie.rated
  end
end
