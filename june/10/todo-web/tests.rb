require 'minitest/autorun'
require 'rack/test'

ENV["TEST"] = ENV["RACK_ENV"] = "test"

require './db/setup'
require './lib/all'

require './server'

require 'pry'

class ToDoTest < Minitest::Test
  include Rack::Test::Methods

  def app
    ToDoWeb
  end

  def setup
    Item.delete_all
  end

  def test_users_can_add_items
    List.create! list_name: "test"

    post "/add",
      description: "Figure out testing",
      list: "test"
    assert_equal 200, last_response.status

    item = Item.find_by_item "Figure out testing"

    assert item
    assert_equal item.id.to_s, last_response.body
  end

  def test_users_can_add_items
    skip
    post "/add", description: "This doesn't have a list"
    assert_equal 0, Item.count
    assert_equal 400, last_response.status
  end
end