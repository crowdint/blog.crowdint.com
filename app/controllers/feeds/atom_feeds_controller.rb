class Feeds::AtomFeedsController < ApplicationController
  def show
    @posts = Post.all_for_feed
  end
end
