class AddCategoryIdToPosts < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :category_id, :integer
  end
end
