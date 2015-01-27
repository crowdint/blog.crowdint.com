class CreateJoinTableCategoryCrowdblogPost < ActiveRecord::Migration
  def change
    create_table :categories_crowdblog_posts do |t|
      t.integer :category_id, index: true
      t.integer :post_id, index: true
    end
  end
end
