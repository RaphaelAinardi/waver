class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats
  has_many :comments
  has_many :experiences
  has_many :follows
  has_many :messages
  has_many :reviews
  has_many :favourites, dependent: :destroy
  has_many :favourite_spots, through: :favourites, source: :spot

  has_one_attached :photo
end
