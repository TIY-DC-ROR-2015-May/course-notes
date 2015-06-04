require 'pry'

require './db/setup'
require './lib/all'

class GifBot
  def add_gif link, username
    user = User.where(name: username).first_or_create!
    #Gif.create! url: link, creator_id: user.id
    user.gifs.create! url: link, seen_count: 0
  end

  def random_gif
    g = Gif.all.sample
    g.has_been_seen!
    g.url
  end

  def all_gifs
    Gif.all
  end

  def tag_gif id, tag_name
    tag = Tag.where(name: tag_name).first_or_create!
    gif = Gif.find id
    #GifTag.create! tag_id: tag.id, gif_id: gif.id
    gif.tags << tag
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
elsif command == "list"
  gifbot.all_gifs.each do |g|
    puts "#{g.id} #{g.creator.name}\t#{g.seen_count}\t#{g.url}\t#{g.all_tags}"
  end
elsif command == "tag"
  id, tag_name = ARGV
  gifbot.tag_gif id, tag_name
else
  puts "I don't know what '#{command}' means"
end