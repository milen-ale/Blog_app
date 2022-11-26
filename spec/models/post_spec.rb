require 'rails_helper'
require 'ffi'

RSpec.describe Post, type: :model do
  before :each do
    @user = User.create(
      name: 'Tom',
      photo: 'https://unsplash.com/photos.com',
      bio: 'Teacher from Mexico.'
    )

    @post = Post.create(
      author: @user,
      title: 'Hello',
      text: 'This is my first post'
    )
  end

  before { subject.save }

  it 'Post title should be present' do
    @post.title = 'my post'
    expect(@post).to be_valid
  end

  context 'All test implementation for Post Model' do
    it 'Check for length of post title' do
      expect(@post.title).to(satisfy { |x| x.length <= 250 })
    end

  it 'commentsCounter greater than or === 0' do
    expect(@post.comments_counter).to be 0
  end

  it 'Should have 0 comments after creation' do
    expect(@post.comments_counter).to eq 0
  end

  it 'likesCounter greater than or === 0' do
    @post.likes_counter = -1
    expect(@post).to_not be_valid
  end

  it 'Should have 0 likes after creation' do
    expect(@post.likes_counter).to eq 0
  end

  it 'Should return n posts after creating n posts' do
    Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    expect(@post.comments_counter).to eq 2
  end

  it 'Should return 5 comments after creating more than 5 posts' do
    Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    Comment.create(post: @post, author: @user, text: 'Hi Tom!')
    expect(@post.return_recent_comments.length).to eq 4
  end
end
end
