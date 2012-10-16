class RenameCrowdblogUsersToUsers < ActiveRecord::Migration
  def change
    rename_table :crowdblog_users, :users
  end
end
