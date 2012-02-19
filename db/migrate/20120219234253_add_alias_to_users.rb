class AddAliasToUsers < ActiveRecord::Migration
  def change
    add_column :users, :gravatar_alias, :string

  end
end
