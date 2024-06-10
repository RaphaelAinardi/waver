class Spot < ApplicationRecord
  has_many :experiences, dependent: :delete_all
  has_many :reviews, dependent: :delete_all
  has_many :favourites, dependent: :destroy
  has_many :favourited_by, through: :favourites, source: :user

  has_many_attached :photos
end
