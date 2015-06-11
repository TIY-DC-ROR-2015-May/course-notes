require 'sinatra/base'
require 'pry'

class GithubRepeater < Sinatra::Base
  get '/user/:username' do
    @name = params[:username]
    erb :user_page
  end
end

GithubRepeater.run!
