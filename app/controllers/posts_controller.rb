class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]

  def index
    @posts = Post.includes(:user).order('created_at DESC')
    @all_ranks = Post.find(Favorite.group(:post_id).order('count(post_id) desc').limit(10).pluck(:post_id))
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def edit
    redirect_to root_path if current_user.id != @post.user.id
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  def search
    if @posts = Post.includes(:user).search(params[:keyword]).order('created_at DESC')
    else
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :product, :genre_id, :type_id, :spoil_id).merge(user_id: current_user.id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
