class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def create
    @comment = @post.comments.create(comment_params)
    @comment.user = current_user

    flash[:notice] = if @comment.save
                       'Comment created successfully!'
                     else
                       'Comment creation unsuccessful!'
                     end
    redirect_to post_path(@post)
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update(comment_params)
        if params[:from] == 'admin'
          format.html { redirect_to admin_post_path(@post), notice: 'Comment updated successfully!' }
        else
          format.html { redirect_to post_url(@post), notice: 'Comment updated successfully!' }
        end
      else
        if params[:from] == 'admin'
          format.html { redirect_to admin_post_path(@post), alert: 'Comment creation unsuccessful!' }
        else
          format.html { redirect_to post_url(@post), alert: 'Comment creation unsuccessful!' }
        end
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    if params[:route] == 'from_admin'
      redirect_to admin_post_path(@post)
    else
      redirect_to post_path(@post)
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
