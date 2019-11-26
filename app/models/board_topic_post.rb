class BoardTopicPost < ApplicationRecord
  belongs_to :board_topic

  validates :username, presence: true
  validates :text, presence: true
end
