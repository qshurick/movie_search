class FilmingLocation < ApplicationRecord
  belongs_to :location
  belongs_to :actor_career
end
