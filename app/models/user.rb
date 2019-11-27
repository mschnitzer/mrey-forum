class User < ApplicationRecord
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :board_topics, dependent: :nullify
  has_many :board_topic_posts, dependent: :nullify

  has_secure_password

  def self.current=(user)
    Thread.current[:user] = user if user.is_a?(User) || user.nil?
  end

  def self.current
    Thread.current[:user]
  end
end
