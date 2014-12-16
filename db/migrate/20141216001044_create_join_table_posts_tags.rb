class CreateJoinTablePostsTags < ActiveRecord::Migration
  def change
    create_join_table :tags, :posts
  end
end
