class AddStateToPost < ActiveRecord::Migration
  def change
    add_column :posts, :state, :string
    add_column :posts, :publisher_id, :integer
    remove_column :posts, :published
  end
end
