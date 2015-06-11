require 'sinatra/base'
require 'pry'

class GithubRepeater < Sinatra::Base
  get '/user/:username' do
    @name = params[:username]
    @friends = ["jamesdabbs", "kylehill", "kwals"]
    erb :user_page
  end
end

GithubRepeater.run!
