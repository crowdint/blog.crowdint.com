class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  delegate :name, to: :author, prefix: true
  delegate :email, to: :author, prefix: true
  delegate :gravatar_url, to: :author

  delegate :year, to: :published_at
  delegate :month, to: :published_at
  delegate :day, to: :published_at

  validates :title, length: { minimum: 5, maximum: 90 }

  def self.all_posts_json
    Post.all.to_json only: [:id, :title], methods: [:author_email]
  end

  def self.for_index
    Post.limit(3).where(published: true).order('published_at DESC')
  end

  def regenerate_permalink
    self.permalink = title.parameterize
  end

  def allowed_to_update_permalink?
    !self.published
  end

  def formatted_published_date
    published_at.strftime("%b %d, %Y")
  end
end
