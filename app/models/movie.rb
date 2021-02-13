class Movie < ApplicationRecord
  has_many :actor_careers
  has_many :actors, through: :actor_careers
  has_many :reviews
end
