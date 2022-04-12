class UsersController < ApplicationController
  def index
    redirect_to new_user_registration_path
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order('created_at DESC')
    # /ユーザー詳細ページでフォロー数とフォロワー数
    @following_users = @user.following_user
    @follower_users = @user.follower_user
    # //
  end

  # フォロー一覧ページ
  def follows
    @user = User.find(params[:id])
    @users = @user.following_user
  end
  # //

  # フォロワー一覧ページ
  def followers
    @user = User.find(params[:id])
    @users = @user.follower_user
  end
  # //

  def favorites
    @user = User.find(params[:id])

    favorites = Favorite.where(user_id: @user.id).pluck(:post_id)
    @posts = Post.find(favorites)
  end
end
