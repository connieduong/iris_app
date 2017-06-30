class PostsController < ApplicationController
  before_action :authorize, only: [:new, :show]

  def index
    @posts = Post.all
  end

  def show
    puts params
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def new
    @post = Post.new
  end

  def create
    puts params
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
      @post.user = current_user
        if @post.save
          redirect_to post_path(@post)
        else
          redirect_to new_post_path
      end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    puts params
    @post = Post.find(params[:id])
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]
    @post.save
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments
    @post.destroy
    redirect_to posts_path
    end

  end
