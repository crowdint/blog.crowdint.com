class CreateUserDropboxSessions < ActiveRecord::Migration
  def change
    create_table :user_dropbox_sessions do |t|
      t.integer :user_id
      t.text :dropbox_session

      t.timestamps
    end
  end
end
