class HomeController < ApplicationController
  before_action :authenticate_user!

  def feed
    if current_user == nil
      @posts = Post.order(created_at: :desc).limit(21)
    else
      following_ids = "SELECT followed_id FROM relationships
                       WHERE follower_id = :user_id"
      @posts = Post.where("user_id IN (#{following_ids})
                       OR user_id = :user_id", user_id: current_user.id)
               .includes(:user).order(created_at: :desc).limit(21)
      end
  end
end
