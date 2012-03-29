xml.instruct!
xml.urlset "xmlns" => "http://www.sitemaps.org/schemas/sitemap/0.9" do
  xml.url do
    xml.loc root_url
    xml.lastmod @posts.last.updated_at
  end

  xml.url do
    xml.loc archive_url
    xml.lastmod @posts.last.updated_at
  end

  @posts.each do |post|
    xml.url do
      xml.loc post_url(*post.url_params)
      xml.lastmod post.updated_at
    end
  end
end
