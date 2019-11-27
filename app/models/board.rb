class Board < ApplicationRecord
  belongs_to :board, optional: true

  has_many :boards
  has_many :board_topics, dependent: :destroy

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
