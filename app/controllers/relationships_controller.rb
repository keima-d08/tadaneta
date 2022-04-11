class RelationshipsController < ApplicationController
  def create
    current_user.follow(params[:user_id])
    # /非同期実装の為の記述
    @user = User.find(params[:user_id])
    # //
  end

  def destroy
    current_user.unfollow(params[:user_id])
    # /非同期実装の為の記述
    @user = User.find(params[:user_id])
    # //
  end
end
