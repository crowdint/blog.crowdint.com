class AddAuthorToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :author_id, :integer

  end
end
