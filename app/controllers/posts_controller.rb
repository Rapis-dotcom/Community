class PostsController < ApplicationController
  def new
    @post = Post.new

  end

  # 投稿データの保存
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.genre_id = 1
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def index
    #@posts = Post.page(params[:page])
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id]) 
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id]) 
  end

  def update
    @post = Post.find(params[:id])
    unless @post.user.id == current_user.id
      redirect_to post_path
    end
    if @post.update(post_params)
      flash[:notice] = "You have created post successfully."
      redirect_to post_path(@post.id) 
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to '/posts'
  end
  
  # 投稿データのストロングパラメータ
  private

  def post_params
    params.require(:post).permit(:title, :image, :body)
  end
end
