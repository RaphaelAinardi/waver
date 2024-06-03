class Experience < ApplicationRecord
  belongs_to :spot
  belongs_to :user
  has_many :comments

  has_many_attached :photos
end
