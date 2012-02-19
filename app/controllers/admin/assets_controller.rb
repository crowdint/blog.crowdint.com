class Admin::AssetsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    asset = @post.assets.build
    asset.attachment = params['Filedata']
    asset.save!

    render json: asset
  end
end
