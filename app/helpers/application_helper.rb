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
      custom_link('Next >', main_app.post_path(*post.next.url_params), class: 'next')
    else
      custom_link('Next >', 'javascript:void(0)', class: 'next')
    end
  end

  def previous_link(post)
    if post.previous
      custom_link('< Previous', main_app.post_path(*post.previous.url_params), class: 'previous')
    else
      custom_link('< Previous', 'javascript:void(0)', class: 'previous')
    end
  end

  def next_link_mobile(post)
    if post.next
      custom_link('>', main_app.post_path(*post.next.url_params), class: 'next')
    else
      custom_link('>', 'javascript:void(0)', class: 'next')
    end
  end

  def previous_link_mobile(post)
    if post.previous
      custom_link('<', main_app.post_path(*post.previous.url_params), class: 'previous')
    else
      custom_link('<', 'javascript:void(0)', class: 'previous')
    end
  end

  def get_home_category(category)
    if category
      custom_link("Home / #{ category.name }", 'javascript:void(0)', class: 'category-link')
    else
      custom_link('Home / None', 'javascript:void(0)', class: 'category-link')
    end
  end

  def category_link(category)
    if category
      custom_link(category.name, 'javascript:void(0)')
    else
      custom_link('None', 'javascript:void(0)')
    end
  end

  def custom_link(text, url, attr = {})
    link_to text, url, attr
  end

  def index_page?
    if params[:controller] == 'crowdblog/posts' && params[:action] == 'index'
      'index'
    end
  end
end
