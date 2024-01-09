class HomeController < ApplicationController
  def feed
    if current_user == nil
      @pagy, @posts = pagy Post.order(created_at: :desc).limit(21)
    else
      user_id = current_user.id

      # IDs of users that the current user follows
      followed_ids = Relationship.where(follower_id: user_id).pluck(:followed_id)

      posts = Post.where(user_id: followed_ids).includes(:user).order(created_at: :desc).limit(21)
      @combined_ids = followed_ids
      if posts.length < 21
        unfollowed_ids = User.where.not(id: user_id)
                             .where.not(id: followed_ids)
                             .pluck(:id)

        # Combine both sets of IDs
        @combined_ids = followed_ids + unfollowed_ids
      end

      @pagy, @posts = pagy(Post.where(user_id: @combined_ids)
                               .includes(:user).order(created_at: :desc).limit(21))
    end
  end

  def explore
    q = params[:q]
    puts q
    @pagy_posts, @posts = pagy Post.ransack(title_or_user_email_or_user_full_name_cont: q).result.includes(:user).order(created_at: :desc), items: 20
    @pagy_users, @users = pagy User.ransack(full_name_or_email_cont: q).result.order(created_at: :desc), items: 20
  end
end
