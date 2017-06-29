class UsersController < ApplicationController
  before_action :authorize, only: [:show ]

  def index
    @users = User.all
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @posts = User.find(params[:id]).posts

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
      if @user.update_attributes(user_params)
      else
        render 'edit'
      end
  end

  def delete
  end

  private
  def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :pic_url)
  end

end
