class CreateBoardTopicPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :board_topic_posts do |t|
      t.string :username
      t.mediumtext :text
      t.belongs_to :board_topic
      t.timestamps
    end
  end
end
