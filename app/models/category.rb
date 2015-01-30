class Category < ActiveRecord::Base
  has_and_belongs_to_many :posts

  def published_posts
    self.posts.where(state: :published).
      order(published_at: :desc)
  end

  scope :with_posts, -> { joins(:posts).uniq }
end
