class UsersController < ApplicationController

  def top
  
  end

  def show
    @user = User.find(params[:id]) 
    #@user.post = @user.post_images.page(params[:page])
  end

  def mypage
    @user = current_user
    #@posts = Post.all # 全部の投稿
    @posts = @user.posts # ログインしている人の投稿たち
  end

  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)  
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
