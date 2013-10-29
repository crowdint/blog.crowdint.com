class AddFinishedAtToPosts < ActiveRecord::Migration
  def change
    add_column :crowdblog_posts, :finished_at, :datetime
  end
end
