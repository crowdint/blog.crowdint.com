class Feeds::AtomFeedsController < ApplicationController
  caches_page :show

  def show
    @posts = Post.all_for_feed
  end
end
