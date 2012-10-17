class Admin::AuthorsController < Crowdblog::Admin::BaseController
  def index
    @authors = User.includes(:published_posts).sort {|a,b| b.published_posts.size <=> a.published_posts.size}
  end
end
