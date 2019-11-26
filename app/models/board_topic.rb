class BoardTopic < ApplicationRecord
  belongs_to :board
  has_many :board_topic_posts, dependent: :destroy

  validates :title, presence: true
  validates :username, presence: true
end
