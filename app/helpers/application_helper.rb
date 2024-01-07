module ApplicationHelper
  def logged_in_user?(user)
    if current_user == user
      true
    else
      false
    end
  end

  def full_title(page_title = '')
    base_title = "Blog"
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
end
