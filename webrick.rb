#!/usr/bin/ruby
 
require 'webrick'
include WEBrick
 
def start_webrick(config = {})
  server = HTTPServer.new(config)
 
  ['INT', 'TERM'].each do |signal|
    trap(signal) { server.shutdown }
  end
 
  server.start
end
 
start_webrick(:DocumentRoot => '.',
              :Port => 5001)
