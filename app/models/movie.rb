class Movie < ApplicationRecord
  has_many :actor_careers
  has_many :actors, through: :actor_careers
  has_many :reviews

  default_scope { includes(:actors,:reviews) }

  attr_accessor :rating

  scope :by_actor, -> (name) do
    actor = Actor.find_by 'name like ?', "%#{name}%"
    puts actor
    return actor.movies.rated if actor
    []
  end

  scope :rated, -> {
    rating_source = self.get_movie_ratings
    all.map do |movie|
      self.enrich_model_with_rating movie, rating_source
      movie
    end
  }

  private

  class << self
    def get_movie_ratings
      Movie.select('movies.id')
           .select('avg(reviews.stars) as rating')
           .joins(:reviews)
           .group('movies.id')
           .order(rating2: :desc)
           .map(&:attributes)
    end

    def enrich_model_with_rating (movie, rating_source)
      movie_with_rating = rating_source.select { |rated_movie| rated_movie['id'] == movie.id }.first
      movie.rating = movie_with_rating['rating'].to_s
      movie
    end
  end
end
