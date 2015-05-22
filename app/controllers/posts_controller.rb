class PostsController < ApplicationController
  def index
    @posts = Post.all.includes(user: :address)
  end
end
