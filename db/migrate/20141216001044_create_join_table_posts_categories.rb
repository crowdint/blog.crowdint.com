class CreateJoinTablePostsCategories < ActiveRecord::Migration
  def change
    create_join_table :categories, :posts
  end
end
