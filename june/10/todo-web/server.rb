require 'sinatra/base'

require './todo'

class ToDoWeb < Sinatra::Base
  set :logging, true

  post "/add" do
    listicize = ToDoList.new
    item = listicize.create_entry params[:list], params[:description], params[:due_date]
    item.id.to_s
  end

  get "/list/:name" do
    list = List.find_by_list_name! params[:name]
    list.items.to_json
  end
end

# $0 is $PROGRAM_NAME
if $0 == __FILE__
  ToDoWeb.start!
end