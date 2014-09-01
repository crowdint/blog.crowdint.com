class User < ActiveRecord::Base
  include Crowdblog::User
  include Gravtastic

  has_one :user_dropbox_session

  gravtastic :gravatar_email, size: 150

  def gravatar_email
    gravatar_alias || email
  end

  def self.publishers
    where(:is_publisher => true)
  end

  def self.published_authors
    includes(:published_posts).select {|u| u.published_posts.size > 0}
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def is_publisher?
    self.is_publisher
  end

  class << self
    def find_identity(uid, provider, email)
      where(uid: uid, provider: provider).first || where(email: email).first
    end
  end
end
