class Post < ActiveRecord::Base
  versioned

  belongs_to :author, class_name: 'User'
  belongs_to :publisher, class_name: 'User'
  has_many :assets

  delegate :name, to: :author, prefix: true
  delegate :email, to: :author, prefix: true
  delegate :gravatar_url, to: :author

  delegate :year, to: :published_at

  validates :title, length: { minimum: 5, maximum: 90 }

  attr_accessible :title, :body, :updated_by

  state_machine initial: :drafted do
    state :drafted
    state :published

    before_transition on: :publish do |post, transition|
      #post.update_attribute(:published_at, Time.now)
      post.published_at ||= Time.now
    end

    event :publish do
      transition drafted: :published
    end

    event :draft do
      transition published: :drafted
    end
  end

  def self.all_posts_json
    Post.order('created_at desc').to_json only: [:id, :title, :state, :published_at], methods: [:author_email, :published?]
  end

  def self.for_index
    Post.limit(3).where(state: 'published').order('published_at DESC')
  end

  def self.for_history
    Post.limit(13).where(state: 'published').order('published_at DESC')
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

  def month
    "%02d" % published_at.month
  end

  def day
    "%02d" % published_at.day
  end

  #
  # Use this methods to generate the post url
  # always use with the splat
  # operator
  #
  # Example:
  #   post_url(*post.url_params)
  #
  def url_params
    [self.year, self.month, self.day, self.permalink, 'html']
  end

  def html_body
    @@renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
    @@renderer.render(self.body).html_safe
  end

  def publish_if_allowed(transition, user)
    if user.is_publisher?
      self.publisher = user
      self.send(transition)
    end
  end
end
