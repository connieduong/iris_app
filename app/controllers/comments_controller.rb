class CommentsController < ApplicationController

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:id])
    @post.comments.create({
      body: params[:comment][:body],
      user_id: current_user.id,
      post_id: @post.id,
    })

    redirect_to post_path(@post)
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.body = params[:comment][:id]
    @comment.save
    redirect_to post_path(@post)
  end


  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy  
    redirect_to posts_path
  end
end
