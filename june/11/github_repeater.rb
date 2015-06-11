require 'sinatra/base'
require 'pry'

require 'httparty'

class GithubRepeater < Sinatra::Base
  set :logging, true

  get '/user/:username' do
    @name = params[:username]
    @friends = ["jamesdabbs", "kylehill", "kwals"]
    @repos = HTTParty.get("https://api.github.com/users/#{@name}/repos",
        query: { per_page: 100 })
    erb :user_page
  end
end

GithubRepeater.run!
