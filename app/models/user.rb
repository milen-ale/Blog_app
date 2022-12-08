  class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,confirmable
  has_many :comments, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'author_id'

  # Validations
  validates :name, presence: true, length: { minimum: 1, maximum: 250 }
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_posts
    Post.limit(3).order(created_at: :desc)
  end
  end
