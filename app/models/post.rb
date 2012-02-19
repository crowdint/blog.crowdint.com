class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User'

  delegate :name, to: :author, prefix: true
  delegate :email, to: :author, prefix: true

  def self.all_posts_json
    Post.all.to_json only: [:id, :title], methods: [:author_email]
  end

  def regenerate_permalink
    self.permalink = title.parameterize
  end

  def allowed_to_update_permalink?
    !self.published
  end
end
