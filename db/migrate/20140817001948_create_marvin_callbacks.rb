class CreateMarvinCallbacks < ActiveRecord::Migration
  def change
    create_table :marvin_callbacks do |t|
      t.string :raw_xml
      t.string :import_status
      t.string :import_status_details
      t.string :guid
      t.string :orig_stamp

      t.timestamps
    end
  end
end
