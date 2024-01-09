class HomeController < ApplicationController
  def feed
    if current_user == nil
      @pagy, @posts = pagy Post.order(created_at: :desc).limit(21)
    else
      user_id = current_user.id

      # IDs of users that the current user follows
      followed_ids = Relationship.where(follower_id: user_id).pluck(:followed_id)

      # IDs of random users not followed by the current user
      unfollowed_ids = User.where.not(id: user_id)
                           .where.not(id: followed_ids)
                           .pluck(:id)

      # Combine both sets of IDs
      @combined_ids = followed_ids + unfollowed_ids


      @pagy, @posts = pagy(Post.where(user_id: @combined_ids)
                               .includes(:user).order(created_at: :desc).limit(21))
    end
  end
end
