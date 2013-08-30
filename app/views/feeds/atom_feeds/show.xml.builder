atom_feed do |feed|
  feed.title 'Crowd Interactive Tech Blog'
  feed.updated @posts.first.updated_at
  feed.image "http://www.crowdint.com/assets/logo/ocre.png"
  feed.icon "http://www.crowdint.com/favicon.ico"

  @posts.each do |post|
    feed.entry(post, url: post_url(*post.url_params)) do |entry|
      entry.title post.title
      entry.content post.html_body, type: 'html'
      #entry.photo post.gravatar_url
      entry.author do |author|
        author.name post.author_name
        author.email post.author_email
      end
    end
  end
end
