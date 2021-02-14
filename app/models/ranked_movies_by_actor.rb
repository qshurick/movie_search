class RankedMoviesByActor
  def self.top_movies(actor_name)
    Movie.from(self.get_query(actor_name)).order(rating2: :desc)
  end

  private

  def self.get_query(actor_name)
    actor_condition = ActiveRecord::Base::sanitize_sql_array ['actors.name like ?', "%#{actor_name}%"]
    <<-SQL
    (
      select movies.*, AVG(reviews.stars) as rating2
      from movies
      join reviews on reviews.movie_id = movies.id
      join actor_careers on actor_careers.movie_id = movies.id
      join actors on actors.id = actor_careers.actor_id
      where #{actor_condition}
      group by movies.id
    ) as movies
    SQL
  end
end