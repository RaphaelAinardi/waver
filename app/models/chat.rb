class Chat < ApplicationRecord
  belongs_to :first_user, class_name: 'User'
  belongs_to :second_user, class_name: 'User'

  has_many :messages, dependent: :destroy

  validates :first_user, uniqueness: { scope: :second_user }

  scope :between, lambda { |user1_id, user2_id|
    where("(chats.first_user_id = ? AND chats.second_user_id = ?) OR (chats.first_user_id = ? AND chats.second_user_id = ?)", user1_id, user2_id, user2_id, user1_id)
  }
end
