class UsersController < ApplicationController
  before_action :authorize, only: [:show ]

  def index
    @users = User.all
    @user = User.new
    def create
      @user = User.new(user_params)
      if @user.save
        redirect_to posts_path
      else
        redirect_to new_user_path
      end
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to posts_path
    else
      redirect_to new_user_path
    end
  end

  def edit
      @user = User.find(params[:id])
  end

    def update
      @user = User.find(params[:id])
          @user.update_attributes(user_params)
          redirect_to user_path(current_user)
      end

  def delete
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :pic_url)
  end

end
