# This callback will record the time when a post has been marked as finished
#
Crowdblog::Post.before_save do |post|
  if post.state_changed? && post.state == 'finished'
    post.finished_at = Time.now
  end
end
