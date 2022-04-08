class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC')
    @following_users = @user.following_user
    @follower_users = @user.follower_user
  end

  def follows
    @user = User.find(params[:id])
    @users = @user.following_user
  end

  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user
  end

  def favorites
    @user = User.find(params[:id])

    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @posts = Post.find(favorites)
  end
end
