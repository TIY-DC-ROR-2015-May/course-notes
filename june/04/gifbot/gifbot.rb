require 'pry'

require './db/setup'
require './lib/all'

class GifBot
  def add_gif link
    Gif.create! url: link
  end

  def random_gif
    puts "Should serve a gif"
  end
end

gifbot  = GifBot.new
command = ARGV.shift

if command == "add"
  gifbot.add_gif ARGV.first
elsif command == "serve"
  gifbot.random_gif
else
  puts "I don't know what '#{command}' means"
end