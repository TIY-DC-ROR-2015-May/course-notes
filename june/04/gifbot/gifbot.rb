require 'pry'

require './db/setup'
require './lib/all'

command = ARGV.shift

if command == "add"
  puts "Should add #{ARGV}"
elsif command == "serve"
  puts "Should serve up a GIF"
else
  puts "I don't know what '#{command}' means"
end