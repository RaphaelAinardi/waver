class Board < ApplicationRecord
  belongs_to :user

  validates :brand, presence: true
  validates :shape, presence: true
  validates :lenght, presence: true
  validates :width, presence: true
  validates :thickness, presence: true

  has_one_attached :image
end
