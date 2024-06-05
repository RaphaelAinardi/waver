class Spot < ApplicationRecord
  has_many :experiences
  has_many :favourites
  has_many :reviews

  has_many_attached :photos
end
