module PostHelper
  def strip_words(html_content, count = 30)
    text = strip_tags(html_content)
    text.split[0..(count-1)].join(" ") + (text.split.size > count ? "..." : "")
  end
end