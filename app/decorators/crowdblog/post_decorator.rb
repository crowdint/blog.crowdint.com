Crowdblog::Post.class_eval do
  def dropbox_name
    "#{self.id}-#{self.permalink}.md"
  end
end
