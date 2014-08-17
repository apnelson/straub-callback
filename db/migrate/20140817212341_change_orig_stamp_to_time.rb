class ChangeOrigStampToTime < ActiveRecord::Migration
  def change
    change_column :marvin_callbacks, :orig_stamp, :integer
  end
end
