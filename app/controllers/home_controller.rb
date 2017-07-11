class HomeController < ApplicationController
  def index
    @posts = Post.all
    @posts_new_4 = Post.order(created_at: :desc).limit(3)
  end
end
