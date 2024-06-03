class Review < ApplicationRecord
  belongs_to :spot
  belongs_to :user

  validates :rating, presence: true
end
