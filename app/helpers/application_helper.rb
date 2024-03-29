module ApplicationHelper
  include Pagy::Frontend


  def logged_in_user?(user)
    if current_user == user
      true
    else
      false
    end
  end

  def same_user?(u, v)
    if u == v
      true
    else
      false
    end
  end

  def full_title(page_title = '')
    base_title = "Burogu - Social blog"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def avatar_url(user)
    return user.avatar_url unless user.avatar_url.nil?

    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "https://www.gravatar.com/avatar/#{gravatar_id}?s=200&d=robohash&r=x"
  end

  def render_header?
    !request.fullpath.include?("auth")
  end

  def number_posts(user)
    user.posts.count
  end
end
