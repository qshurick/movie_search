require 'csv'

namespace :reviews do
  desc "Import reviews from csv file"
  task :import, [:path] do |t, args|
    CSV.foreach( args[:path], headers: true ) do |row|
      title = row['Movie']

      movie = Movie.find_by title: title

      raise "Movie #{title} not found abort import" unless movie

      Review.create! user: row['User'], stars: row['Stars'], review: row['Review'], movie: movie
    end
  end
end