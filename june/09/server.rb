require 'sinatra/base'
require 'json'
require 'pry'

Database = [
  "Twitter for dolphins",
  "Snapchat for snapping turtles"
]

class MyServer < Sinatra::Base

  # List of all ideas
  get '/idea_list' do
    JSON.unparse Database
  end

  # -----

  get '/hi' do
    "Hello World!"
  end

  get "/hello" do
    "No really, hello"
  end

  post "/hi" do
    puts "I'm in the /hi POST handler"
    "Hello World!".reverse
  end

  get "/bad/echo" do
    puts "What word? "
    word = gets.chomp
    "Your word was: #{word}"
  end

  delete "/echo/:word" do
    params[:word]
  end
end

MyServer.run!