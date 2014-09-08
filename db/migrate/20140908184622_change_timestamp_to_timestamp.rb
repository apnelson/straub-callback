class ChangeTimestampToTimestamp < ActiveRecord::Migration
  def change
    change_column :marvin_callbacks, :timestamp, :datetime
  end
end
