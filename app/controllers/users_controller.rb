class UsersController < ApplicationController
  before_filter :user_required

  def index
    render :text => 'Hello from the admin panel!'
  end
end