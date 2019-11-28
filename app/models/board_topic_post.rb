class BoardTopicPost < ApplicationRecord
  belongs_to :board_topic
  belongs_to :user, optional: true

  validates :username, presence: true
  validates :text, presence: true
end
