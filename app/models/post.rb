class Post < Crowdblog::Post
  belongs_to :author, :class_name => "User"
  belongs_to :publisher, :class_name => "User"
  has_and_belongs_to_many :categories

  SHORT_DESCRIPTION_SIZE = 300

  searchable do
    text :title, :body
    string :state
  end

  def self.grouped_for_archive
    published_and_ordered.group_by {|p| p.published_at.year }.
        inject({}) { |mem, value| mem[value[0]] = value[1].
            group_by {|p| p.published_at.strftime("%B")}; mem }
  end

  def previous
    Post.published_and_ordered.
      where('published_at < ?', self.published_at).first
  end

  def next
    Post.published_and_ordered.
      where('published_at > ?', self.published_at).last
  end

  def dropbox_name
    "#{id}-#{permalink}.md"
  end

  def formatted_published_date
    published_at.strftime('%b %d, %Y')
  end

  def first_category
    categories.limit(1).first
  end

  #
  # This is probably not very performant, but should be alleviated
  # with caching. If it doesn't, it should be a better idea to store it on
  # the DB after_save.
  #
  def short_description
    description = ""
    paragraphs = body.split("\n")
    paragraphs.each do |p|
      description << p << "\n"
      break if description.size > SHORT_DESCRIPTION_SIZE
    end
    @@renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                           :autolink => true, :space_after_headers => true)
    @@renderer.render(description).html_safe
  end

  def self.query(query)
    Post.search do
      fulltext query
      with :state, 'published'
    end
  end

  def self.verbose_reindex
    all.each do |post|
      puts post.id
      Sunspot.index post
      Sunspot.commit
    end
  end

  def self.scoped_for(user)
    user.is_publisher? ? all : user.authored_posts
  end
end
