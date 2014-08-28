module SocialHelper
  def facebook_share(post)
    url = "http://www.facebook.com/sharer/sharer.php?s=100&p[url]=#{social_share_url(post)}&p[images][0]=&p[title]=#{social_share_title(post)}&p[summary]="
    link_to image_tag("social/facebook.png"), url, target: "_BLANK"
  end

  def twitter_share(post)
    url = "http://twitter.com/home?status=#{social_share_title(post)} #{social_share_url(post)} via @crowdint"
    link_to image_tag("social/twitter.png"), url, target: "_BLANK"
  end

  def gplus_share(post)
    url = "https://plus.google.com/share?url=#{social_share_url(post)}"
    link_to image_tag("social/gplus.png"), url, target: "_BLANK"
  end

  def linkedin_share(post)
    url = "http://www.linkedin.com/shareArticle?title=#{social_share_title(post)}&url=#{social_share_url(post)}"
    link_to image_tag("social/linkedin.png"), url, target: "_BLANK"
  end

  def social_share_url(post)
    Rack::Utils.escape(main_app.post_url(*post.url_params))
  end

  def social_share_title(post)
    "Crowd Interactive Blog: #{Rack::Utils.escape(post.title)}"
  end
end
