class ArchiveController < ApplicationController
  caches_action :show

  def show
    @posts = Post.grouped_for_archive
  end
end
