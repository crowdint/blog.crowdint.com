require 'actionpack/action_caching'

class ArchiveController < ApplicationController
  caches_action :show

  def show
    @posts = Post.for_index.paginate(page: params[:page], per_page: 30)
  end
end
