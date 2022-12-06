class Comment < ApplicationRecord
  belongs_to :game

  validates :commenter, presence: true
  validates :comment, presence: true, length: {
    minimum: 10
  }
end
