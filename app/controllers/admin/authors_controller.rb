class Admin::AuthorsController < Admin::BaseController
  def index
    @authors = User.includes(:authored_posts).sort {|a,b| b.authored_posts.count <=> a.authored_posts.count}
  end
end
