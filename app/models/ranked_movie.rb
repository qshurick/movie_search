class RankedMovie
  QUERY = <<-SQL
    (
      select movies.*, AVG(reviews.stars) as rating2
      from movies
      join reviews on reviews.movie_id = movies.id
      group by movies.id
    ) as movies
  SQL

  def self.top_movies
    Movie.from(QUERY).order(rating2: :desc)
  end
end