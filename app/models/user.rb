class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats
  has_many :comments
  has_many :experiences
  has_many :favourites
  has_many :follows
  has_many :messages
  has_many :reviews

  has_many :sent_messages, class_name: 'Message', foreign_key: 'user_id'
  has_many :chats_as_first_user, class_name: 'Chat', foreign_key: 'first_user_id'
  has_many :chats_as_second_user, class_name: 'Chat', foreign_key: 'second_user_id'

  has_one_attached :photo
end
