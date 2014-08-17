class ChangeDetailsToText < ActiveRecord::Migration
  def change
    change_column :marvin_callbacks, :import_status_details, :text
  end
end
