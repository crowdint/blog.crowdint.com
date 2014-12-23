module ApplicationHelper
  def event_link_click(link_name)
    "_gaq.push(['_trackEvent', 'Links', 'Click', '#{link_name}']);"
  end

  def twitter_url(user)
    "https://twitter.com/#{user}"
  end

  def github_url(user)
    "https://github.com/#{user}"
  end

  def gplus_url(id)
    "https://plus.google.com/#{id}/posts"
  end

  def behance_url(user)
    "https://www.behance.net/#{user}"
  end

  def facebook_link
    'https://www.facebook.com/CrowdInteractive'
  end

  def foursquare_link
    'https://es.foursquare.com/v/crowd-interactive-20/528663b311d2b92613232f39'
  end

  def github_link
    github_url 'crowdint'
  end

  def gplus_link
    gplus_url 100816706068922064575
  end

  def linkedin_link
    'http://www.linkedin.com/company/543194?trk=tyah&trkInfo=tarId%3A1400178459874%2Ctas%3ACrowd%20Inte%2Cidx%3A2-1-3'
  end

  def twitter_link
    twitter_url 'crowdint'
  end

  def year
    Time.zone.now.year
  end

  def next_link(post)
    if post.next
      link_to '< Next', main_app.post_path(*post.next.url_params),
        class: 'next'
    else
      link_to '< Next', 'javascript:void(0)',
        class: 'next'
    end
  end

  def previous_link(post)
    if post.previous
      link_to 'Previous >', main_app.post_path(*post.previous.url_params),
        class: 'previous'
    else
      link_to 'Previous >', 'javascript:void(0)',
        class: 'previous'
    end
  end

  def next_link_mobile(post)
    if post.next
      link_to '<', main_app.post_path(*post.next.url_params),
        class: 'next'
    else
      link_to '<', 'javascript:void(0)',
        class: 'next'
    end
  end

  def previous_link_mobile(post)
    if post.previous
      link_to '>', main_app.post_path(*post.previous.url_params),
        class: 'previous'
    else
      link_to '>', 'javascript:void(0)',
        class: 'previous'
    end
  end

  def get_home_category(post)
    if post.category
      link_to "Home / #{ post.category.name }", 'javascript:void(0)'
    else
      link_to "Home / None", 'javascript:void(0)'
    end
  end

  def category_link(post)
    if post.category
      link_to post.category.name, 'javascript:void(0)'
    else
      link_to 'None', 'javascript:void(0)'
    end
  end
end
