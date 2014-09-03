class UserDropboxSession < ActiveRecord::Base
  ACCESS_TYPE = :app_folder
  NAME_TO_TITLE_BLANK = /[-_]/

  belongs_to :user

  #attr_accessible :dropbox_session, :user_id

  serialize :dropbox_session

  def put_post(post)
    decorated_post = Post.find(post.id)
    decorated_post.regenerate_permalink
    file = StringIO.new decorated_post.body

    client.put_file decorated_post.dropbox_name, file, 'True'
  end

  def sync
    delta = client.delta delta_cursor
    puts delta
    delta_hash = parse_delta(delta)
    delta_hash.each do |k, v|
      if v
        if k.match /\d+/
          post = Post.scoped_for(user).find k
          post.body = client.get_file k
          post.save!
        elsif k.match /^(.+).md/
          post = Post.new
          post.title = $1.gsub(NAME_TO_TITLE_BLANK, ' ')
          post.body = client.get_file k
          post.author = user
          post.regenerate_permalink
          post.save!

          post.reload
          client.file_delete k
        end
      end
    end

    update_attribute :delta_cursor, delta["cursor"]
  end

  def client
    @client ||= DropboxClient.new dropbox_session, ACCESS_TYPE
  end

  def parse_delta(delta)
    delta["entries"].inject({}) { |m, e| m[e.first[1..-1]] = e.last; m }
  end
end
