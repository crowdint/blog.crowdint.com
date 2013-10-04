class AboutController < ApplicationController
  def show
    @history = ::Post.for_history
  end
end
