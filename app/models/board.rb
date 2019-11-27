class Board < ApplicationRecord
  belongs_to :board, optional: true

  has_many :boards

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
