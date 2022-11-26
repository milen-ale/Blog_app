require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user = User.create(
      name: 'milen',
      photo: 'https://milen.com/me.png',
      bio: 'I am milen.'
    )

    @post = Post.create(
      author: @post,
      title: 'Hey',
      text: 'This is my first post'
    )

    @comment = Comment.create(
      post: @comment,
      author: @user,
      text: 'Hi Tom!'
    )

    @like = Like.create(
      author: @author,
      post: @post
    )
  end
  it ' incriment likes_counter' do
    expect(@comment.author).to eq @user
  end
end
