class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  after_save :update_post_counter

  def return_recent_comments
    Comment.limit(5).order(created_at: :desc)
  end

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end
