require 'minitest/autorun'
require 'rack/test'

require './db/setup'
require './lib/all'

require './server'

require 'pry'

class ToDoTest < Minitest::Test
  include Rack::Test::Methods

  def app
    ToDoWeb
  end

  def test_users_can_add_items
    List.create! list_name: "test"

    post "/add",
      description: "Figure out testing",
      list: "test"
    assert_equal 200, last_response.status

    item = Item.find_by_item "Figure out testing"

    assert item
    assert_equal item.id, last_response.body
  end
end