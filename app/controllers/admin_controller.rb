class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.all.includes(:user, :comments)
  end

  def comments
    @comments = Comment.all.includes(:user, :post).order(updated_at: :desc)
  end

  def users
    @users = User.all
  end

  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end
end
