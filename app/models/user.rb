class User < ApplicationRecord
  has_many :posts, foreign_key: 'user_id'
  has_many :comments, foreign_key: 'user_id'
  has_many :likes, foreign_key: 'user_id'

  # Validations
  validates :name, presence: true, length: { minimum: 1, maximum: 250 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_posts
    Post.limit(3).order(created_at: :desc)
  end
end
