require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  it 'Should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'postCounter greater than or === 0' do
    subject.posts_counter = -1
    expect(subject).to_not be_valid
  end

  it 'Should have 0 posts after creation' do
    expect(subject.posts_counter).to eq 0
  end

  it 'Should return n posts after creating n posts' do
    Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    Post.create(author: subject, title: 'Hello again', text: 'This is my second post')
    Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    Post.create(author: subject, title: 'Hello again', text: 'This is my second post')
    Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    expect(subject.posts_counter).to eq 5
  end

  it 'Should return 3 posts after creating more than 3 posts' do
    Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    Post.create(author: subject, title: 'Hello again', text: 'This is my second post')
    Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    Post.create(author: subject, title: 'Hello again', text: 'This is my second post')
    Post.create(author: subject, title: 'Hello', text: 'This is my first post')
    expect(subject.return_recent_posts.length).to eq 3
  end
end
