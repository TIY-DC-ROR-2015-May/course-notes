require 'pry'

require './db/setup'
require './lib/all'

class GifBot
  def add_gif link, username
    user = User.where(name: username).first_or_create!
    #Gif.create! url: link, creator_id: user.id
    user.gifs.create! url: link
  end

  def random_gif
    g = Gif.all.sample
    g.url
  end
end

gifbot  = GifBot.new
command = ARGV.shift

if command == "add"
  username = `whoami`.chomp
  gifbot.add_gif ARGV.first, username
elsif command == "serve"
  link = gifbot.random_gif
  system "open -a 'Google Chrome' '#{link}'"
else
  puts "I don't know what '#{command}' means"
end