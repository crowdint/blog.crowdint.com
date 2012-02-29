class AddReviewFieldsToPost < ActiveRecord::Migration
  def change
    add_column :posts, :ready_for_review, :boolean
    add_column :posts, :marked_for_review_at, :datetime
  end
end
