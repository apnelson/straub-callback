json.array!(@marvin_callbacks) do |marvin_callback|
  json.extract! marvin_callback, :id, :raw_xml, :import_status, :import_status_details, :guid, :orig_stamp
  json.url marvin_callback_url(marvin_callback, format: :json)
end
