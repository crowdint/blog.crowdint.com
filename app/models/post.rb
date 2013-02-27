class Post < Crowdblog::Post
  belongs_to :author, :class_name => "User"
  belongs_to :publisher, :class_name => "User"

  searchable do
    text :title, :body
    string :state
  end

  def self.grouped_for_archive
    published_and_ordered.group_by {|p| p.published_at.year }.
        inject({}) { |mem, value| mem[value[0]] = value[1].
            group_by {|p| p.published_at.strftime("%B")}; mem }
  end

  def dropbox_name
    "#{id}-#{permalink}.md"
  end

  def short_description
    body.first(300).gsub(/\n/, '') + "..."
  end

  def self.query(query)
    Post.search do
      fulltext query
      with :state, 'published'
    end
  end
end
