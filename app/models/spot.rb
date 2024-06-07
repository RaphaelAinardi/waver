class Spot < ApplicationRecord
  has_many :experiences, dependent: :delete_all
  has_many :favourites, dependent: :delete_all
  has_many :reviews, dependent: :delete_all

  has_many_attached :photos
end
