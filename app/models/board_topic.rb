class BoardTopic < ApplicationRecord
  belongs_to :board
  belongs_to :user, optional: true

  has_many :board_topic_posts, dependent: :destroy

  validates :title, presence: true
  validates :username, presence: true

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
