class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :email
      t.boolean :admin, default: false, null: false
      t.boolean :moderator, default: false, null: false
      t.timestamps
    end

    add_belongs_to :board_topics, :user, after: :title
    add_belongs_to :board_topic_posts, :user, after: :id
  end
end
