class AddDeltaCursorToUserDropboxSession < ActiveRecord::Migration
  def change
    add_column :user_dropbox_sessions, :delta_cursor, :string
  end
end
