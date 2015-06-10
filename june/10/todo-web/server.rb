require 'sinatra/base'

class ToDoWeb < Sinatra::Base
  set :logging, true
end

# $0 is $PROGRAM_NAME
if $0 == __FILE__
  ToDoWeb.start!
end