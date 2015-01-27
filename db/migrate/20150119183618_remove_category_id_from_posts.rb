class RemoveCategoryIdFromPosts < ActiveRecord::Migration
  def change
    remove_column :crowdblog_posts, :category_id, :integer
  end
end
