#!/usr/bin/env ruby

require 'rest_client'
require 'guid'

guid = Guid.new.to_s
ts   = Time.now.to_i.to_s

client = RestClient::Resource.new("http://localhost:3000/marvin_callbacks?guid=#{guid}&timestamp=#{ts}")

body = "<FileImportStatus><import_status>Successful</import_status><import_status_details>details here</import_status_details></FileImportStatus>"
content_type = "text/xml"
res = client.put body, :content_type => content_type
puts res.inspect
