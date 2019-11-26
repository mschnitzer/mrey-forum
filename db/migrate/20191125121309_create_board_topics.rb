class CreateBoardTopics < ActiveRecord::Migration[6.0]
  def change
    create_table :board_topics do |t|
      t.string :title
      t.string :username
      t.belongs_to :board
      t.timestamps
    end
  end
end
