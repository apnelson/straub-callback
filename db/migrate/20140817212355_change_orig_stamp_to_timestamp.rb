class ChangeOrigStampToTimestamp < ActiveRecord::Migration
  def change
    rename_column :marvin_callbacks, :orig_stamp, :timestamp
  end
end
