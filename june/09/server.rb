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

  post '/new_idea' do
    Database.push params[:idea]
    response = { status: :ok, id: (Database.length - 1) }
    JSON.unparse response
  end

  get '/idea/:id' do
    position = params[:id].to_i
    idea     = Database[position]
    JSON.unparse({ id: position, idea: idea })
  end

  get '/idea' do
    Database.sample
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