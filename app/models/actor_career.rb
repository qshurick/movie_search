class ActorCareer < ApplicationRecord
  belongs_to :actor
  belongs_to :movie
  has_many :filming_locations
  has_many :locations, through: :filming_locations
end
