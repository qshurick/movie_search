class Actor < ApplicationRecord
  has_many :actor_careers
  has_many :movies, through: :actor_careers
end
