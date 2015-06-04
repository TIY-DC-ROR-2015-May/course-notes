require 'pry'

require './db/setup'
require './lib/all'

class GifBot
  def add_gif link
    Gif.create! url: link
  end

  def random_gif
    g = Gif.all.sample
    g.url
  end
end

gifbot  = GifBot.new
command = ARGV.shift

if command == "add"
  gifbot.add_gif ARGV.first
elsif command == "serve"
  link = gifbot.random_gif
  system "open -a 'Google Chrome' '#{link}'"
else
  puts "I don't know what '#{command}' means"
end