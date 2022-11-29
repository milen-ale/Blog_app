class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = post.find(prams[:id])
  end
end
