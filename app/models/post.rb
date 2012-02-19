class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  belongs_to :publisher, class_name: 'User'

  delegate :name, to: :author, prefix: true
  delegate :email, to: :author, prefix: true
  delegate :gravatar_url, to: :author

  delegate :year, to: :published_at
  delegate :month, to: :published_at
  delegate :day, to: :published_at

  validates :title, length: { minimum: 5, maximum: 90 }

  attr_accessible :title, :body

  state_machine initial: :drafted do
    state :drafted
    state :published

    before_transition on: :publish do |post, transition|
      #post.update_attribute(:published_at, Time.now)
      post.published_at = Time.now
    end

    event :publish do
      transition drafted: :published
    end

    event :draft do
      transition published: :drafted
    end
  end

  def self.all_posts_json
    Post.all.to_json only: [:id, :title, :state], methods: [:author_email, :published?]
  end

  def self.for_index
    Post.limit(3).where(state: 'published').order('published_at DESC')
  end

  def regenerate_permalink
    self.permalink = title.parameterize
  end

  def allowed_to_update_permalink?
    !self.published?
  end

  def formatted_published_date
    published_at.strftime("%b %d, %Y")
  end
end
