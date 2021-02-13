require 'csv'

namespace :movies do
  desc "Import movies and actors from csv file"
  task :import, [:path] do |t, args|
    CSV.foreach( args[:path], headers: true ) do |row|
      title = row['Movie']

      movie = Movie.find_by title: title

      unless movie
        movie = Movie.create!(
          title: title,
          description: row['Description'],
          year: row['Year'].to_i,
          country: row['Country'],
          director: row['Director']
        )
      end

      actor_name = row['Actor']

      actor = Actor.find_by name: actor_name

      unless actor
        actor = Actor.create! name: actor_name
      end

      location_name = row['Filming location']

      location = Location.find_by name: location_name
      location = Location.create! name: location_name unless location

      actor_career = ActorCareer.find_by actor: actor, movie: movie
      actor_career = ActorCareer.create! actor: actor, movie: movie unless actor_career

      FilmingLocation.create! location: location, actor_career: actor_career
    end
  end
end
