class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :chats
  has_many :comments, dependent: :destroy
  has_many :experiences, dependent: :destroy
  has_many :favourites, dependent: :destroy
  has_many :follows, foreign_key: :first_user_id, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :messages
  has_many :reviews
  has_many :boards

  has_many :sent_messages, class_name: 'Message', foreign_key: 'user_id'
  has_many :chats_as_first_user, class_name: 'Chat', foreign_key: 'first_user_id'
  has_many :chats_as_second_user, class_name: 'Chat', foreign_key: 'second_user_id'

  has_one_attached :photo

  def chatroom(other_user)
    chat = Chat.find_by(first_user_id: self.id, second_user_id: other_user.id)
    return chat if chat # unless Chat.nil?

    chat = Chat.find_by(first_user_id: other_user.id, second_user_id: self.id)
    return chat if chat # unless Chat.nil?

    Chat.create(first_user_id: self.id, second_user_id: other_user.id)
  end
end
