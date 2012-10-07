class RenameCrowdblogTables < ActiveRecord::Migration
  def change
    rename_table :users, :crowdblog_users
    rename_table :assets, :crowdblog_assets
    rename_table :posts, :crowdblog_posts
  end
end
