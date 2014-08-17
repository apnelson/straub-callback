class ChangeRawXmlToText < ActiveRecord::Migration
  def change
    change_column :marvin_callbacks, :raw_xml, :text
  end
end
