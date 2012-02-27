class ArchiveController < ApplicationController
  caches_page :show

  def show
    @posts = Post.grouped_for_archive
  end
end
