class Board < ApplicationRecord
  belongs_to :board, optional: true
  has_many :boards
end
