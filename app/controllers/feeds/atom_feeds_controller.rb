class Feeds::AtomFeedsController < ApplicationController
  caches_action :show

  def show
    @posts = Post.all_for_feed
  end
end
