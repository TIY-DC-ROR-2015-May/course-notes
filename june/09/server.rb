require 'sinatra/base'

class MyServer < Sinatra::Base
  get '/hi' do
    "Hello World!"
  end

  get "/hello" do
    "No really, hello"
  end

  post "/hi" do
    "Hello World!".reverse
  end
end

MyServer.run!