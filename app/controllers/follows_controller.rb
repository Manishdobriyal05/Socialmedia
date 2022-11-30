class FollowsController < ApplicationController

  def create
    # @user = User.find(params[:follower_id])
    current_user.follow(user)
    redirect_to @user
    # redirect_to :back
  end

  def destroy
    # @user = Follow.find(params[:id]).follower_id
    current_user.unfollow(user)
    redirect_to @user
    # redirect_to :back
  end

  private

  def find_user
    @user User.find(params[:user_id])
  end
end



