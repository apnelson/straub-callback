#!/usr/bin/env ruby

require 'rest_client'
require 'guid'

guid = Guid.new.to_s
ts   = Time.now.to_i.to_s

client = RestClient::Resource.new("http://64.122.244.196:5054/marvin_callbacks?guid=#{guid}&timestamp=#{ts}")

body = "<FileImportStatus><import_status>Failed</import_status><import_status_details>details here</import_status_details></FileImportStatus>"
content_type = "text/xml"
res = client.put body, :content_type => content_type
puts res.inspect
