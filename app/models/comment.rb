class Comment < ApplicationRecord
  belongs_to :experience
  belongs_to :user

  validates :content, presence: true, unless: :like?
  validates :like, presence: true, unless: :content?
end
