module ApplicationHelper
  def event_link_click(link_name)
    "_gaq.push(['_trackEvent', 'Links', 'Click', '#{link_name}']);"
  end
end
