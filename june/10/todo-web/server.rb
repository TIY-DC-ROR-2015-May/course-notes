require 'sinatra/base'

class ToDoWeb < Sinatra::Base
  set :logging, true
end

ToDoWeb.start!