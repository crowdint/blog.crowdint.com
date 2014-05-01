class CreateCrowdblogStatusChangeRecords < ActiveRecord::Migration
  def change
    create_table :crowdblog_status_change_records do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.string :state

      t.timestamps
    end
  end
end
